PRIVOXY-REGRESSION-TEST(1)                              User Contributed Perl Documentation                             PRIVOXY-REGRESSION-TEST(1)

NAME
       privoxy-regression-test - A regression test "framework" for Privoxy.

SYNOPSIS
       privoxy-regression-test [--debug bitmask] [--forks forks] [--fuzzer-feeding] [--fuzzer-feeding] [--help] [--level level] [--local-test-file
       testfile] [--loops count] [--max-level max-level] [--max-time max-time] [--min-level min-level] --privoxy-address proxy-address [--retries
       retries] [--test-number test-number] [--show-skipped-tests] [--sleep-time seconds] [--verbose] [--version]

DESCRIPTION
       Privoxy-Regression-Test is supposed to one day become a regression test suite for Privoxy. It's not quite there yet, however, and can
       currently only test header actions, check the returned status code for requests to arbitrary URLs and verify which actions are applied to
       them.

       Client header actions are tested by requesting http://p.p/show-request and checking whether or not Privoxy modified the original request as
       expected.

       The original request contains both the header the action-to-be-tested acts upon and an additional tagger-triggering header that enables the
       action to test.

       Applied actions are checked through http://p.p/show-url-info.

CONFIGURATION FILE SYNTAX
       Privoxy-Regression-Test's configuration is embedded in Privoxy action files and loaded through Privoxy's web interface.

       It makes testing a Privoxy version running on a remote system easier and should prevent you from updating your tests without updating
       Privoxy's configuration accordingly.

       A client-header-action test section looks like this:

           # Set Header    = Referer: http://www.example.org.zwiebelsuppe.exit/
           # Expect Header = Referer: http://www.example.org/
           {+client-header-filter{hide-tor-exit-notation} -hide-referer}
           TAG:^client-header-filter\{hide-tor-exit-notation\}$

       The example above causes Privoxy-Regression-Test to set the header Referer: http://www.example.org.zwiebelsuppe.exit/ and to expect it to
       be modified to Referer: http://www.example.org/.

       When testing this section, Privoxy-Regression-Test will set the header X-Privoxy-Control: client-header-filter{hide-tor-exit-notation}
       causing the privoxy-control tagger to create the tag client-header-filter{hide-tor-exit-notation} which will finally cause Privoxy to
       enable the action section.

       Note that the actions itself are only used by Privoxy, Privoxy-Regression-Test ignores them and will be happy as long as the expectations
       are satisfied.

       A fetch test looks like this:

           # Fetch Test = http://p.p/user-manual
           # Expect Status Code = 302

       It tells Privoxy-Regression-Test to request http://p.p/user-manual and to expect a response with the HTTP status code 302. Obviously that's
       not a very thorough test and mainly useful to get some code coverage for Valgrind or to verify that the templates are installed correctly.

       If you want to test CGI pages that require a trusted referer, you can use:

           # Trusted CGI Request = http://p.p/edit-actions

       It works like ordinary fetch tests, but sets the referer header to a trusted value.

       If no explicit status code expectation is set, 200 is used.

       To verify that a URL is blocked, use:

           # Blocked URL = http://www.example.com/blocked

       To verify that a specific set of actions is applied to an URL, use:

           # Sticky Actions = +block{foo} +handle-as-empty-document -handle-as-image
           # URL = http://www.example.org/my-first-url

       The sticky actions will be checked for all URLs below it until the next sticky actions directive.

       To verify that requests for a URL get redirected, use:

           # Redirected URL = http://www.example.com/redirect-me
           # Redirect Destination = http://www.example.org/redirected

       To skip a test, add the following line:

           # Ignore = Yes

       The difference between a skipped test and a removed one is that removing a test affects the numbers of the following tests, while a skipped
       test is still loaded and thus keeps the test numbers unchanged.

       Sometimes user modifications intentionally conflict with tests in the default configuration and thus cause test failures. Adding the Ignore
       directive to the failing tests works but is inconvenient as the directive is likely to get lost with the next update.

       Overwrite conditions are an alternative and can be added in any action file as long as the come after the test that is expected to fail.
       They causes all previous tests a matching the condition to be skipped.

       It is recommended to put the overwrite condition below the custom Privoxy section that causes the expected test failure and before the
       custom test that verifies that tests the now expected behaviour. Example:

           # The following section is expected to overwrite a section in
           # default.action, whose effect is being tested. Thus also disable
           # the test that is now expected to fail and add a new one.
           #
           {+block{Facebook makes Firefox even more unstable. Do not want.}}
           # Overwrite condition = http://apps.facebook.com/onthefarm/track.php?creative=&cat=friendvisit&subcat=weeds&key=a789a971dc687bee4c20c044834fabdd&next=index.php%3Fref%3Dnotif%26visitId%3D898835505
           # Blocked URL = http://apps.facebook.com/
           .facebook./

TEST LEVELS
       All tests have test levels to let the user control which ones to execute (see OPTIONS below).  Test levels are either set with the Level
       directive, or implicitly through the test type.

       Redirect tests default to level 108, block tests to level 7, fetch tests to level 6, "Sticky Actions" tests default to level 5, tests for
       trusted CGI requests to level 3 and client-header-action tests to level 1.

       The current redirect test level is above the default max-level value as failed tests will result in outgoing connections. Use the
       --max-level option to run them as well.

       The "Default level offset" directive can be used to change the default level by a given value. This directive affects all tests located
       after it until the end of the file or a another "Default level offset" directive is reached. The purpose of this directive is to make it
       more convenient to skip similar tests in a given file without having to remove or disable the tests completely.

OPTIONS
       --debug bitmask Add the bitmask provided as integer to the debug settings.

       --forks forks Number of forks to start before executing the regression tests. This is mainly useful for stress-testing.

       --fuzzer-address Listening address used when executing the regression tests. Useful to make sure that the requests to load the regression
       tests don't fail due to fuzzing.

       --fuzzer-feeding Ignore some errors that would otherwise cause Privoxy-Regression-Test to abort the test because they shouldn't happen in
       normal operation. This option is intended to be used if Privoxy-Regression-Test is only used to feed a fuzzer in which case there's a high
       chance that Privoxy gets an invalid request and returns an error message.

       --help Shows available command line options.

       --header-fuzzing Modifies linear white space in headers in a way that should not affect the test result.

       --level level Only execute tests with the specified level.

       --local-test-file test-file Do not get the tests through Privoxy's web interface, but use a single local file. Not recommended for testing
       Privoxy, but can be useful to "misappropriate" Privoxy-Regression-Test to test other stuff, like webserver configurations.

       --loop count Loop through the regression tests count times.  Useful to feed a fuzzer, or when doing stress tests with several Privoxy-
       Regression-Test instances running at the same time.

       --max-level max-level Only execute tests with a level below or equal to the numerical max-level.

       --max-time max-time Give Privoxy max-time seconds to return data. Increasing the default may make sense when Privoxy is run through
       Valgrind, decreasing the default may make sense when Privoxy-Regression-Test is used to feed a fuzzer.

       --min-level min-level Only execute tests with a level above or equal to the numerical min-level.

       --privoxy-address proxy-address Privoxy's listening address.  If it's not set, the value of the environment variable http_proxy will be
       used. proxy-address has to be specified in http_proxy syntax.

       --retries retries Retry retries times.

       --test-number test-number Only run the test with the specified number.

       --show-skipped-tests Log skipped tests even if verbose mode is off.

       --shuffle-tests Shuffle test sections and their tests before executing them. When combined with --forks, this can increase the chances of
       detecting race conditions. Of course some problems are easier to detect without this option.

       --sleep-time seconds Wait seconds between tests. Useful when debugging issues with systems that don't log with millisecond precision.

       --verbose Log successful tests as well. By default only the failures are logged.

       --version Print version and exit.

       The second dash is optional, options can be shortened, as long as there are no ambiguities.

PRIVOXY CONFIGURATION
       Privoxy-Regression-Test is shipped with regression-tests.action which aims to test all official client-header modifying actions and can be
       used to verify that the templates and the user manual files are installed correctly.

       To use it, it has to be copied in Privoxy's configuration directory, and afterwards referenced in Privoxy's configuration file with the
       line:

           actionsfile regression-tests.action

       In general, its tests are supposed to work without changing any other action files, unless you already added lots of taggers yourself. If
       you are using taggers that cause problems, you might have to temporary disable them for Privoxy's CGI pages.

       Some of the regression tests rely on Privoxy features that may be disabled in your configuration. Tests with a level below 7 are supposed
       to work with all Privoxy configurations (provided you didn't build with FEATURE_GRACEFUL_TERMINATION).

       Tests with level 9 require Privoxy to deliver the User Manual, tests with level 12 require the CGI editor to be enabled.

CAVEATS
       Expect the configuration file syntax to change with future releases.

LIMITATIONS
       As Privoxy's show-request page only shows client headers, Privoxy-Regression-Test can't use it to test Privoxy actions that modify server
       headers.

       As Privoxy-Regression-Test relies on Privoxy's tag feature to control the actions to test, it currently only works with Privoxy 3.0.7 or
       later.

       At the moment Privoxy-Regression-Test fetches Privoxy's configuration page through curl(1), therefore you have to have curl installed,
       otherwise you won't be able to run Privoxy-Regression-Test in a meaningful way.

SEE ALSO
       privoxy(1) curl(1)

AUTHOR
       Fabian Keil <fk@fabiankeil.de>

perl v5.22.1                                                        2017-01-12                                          PRIVOXY-REGRESSION-TEST(1)
