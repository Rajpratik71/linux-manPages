SWIFT-FORM-SIGNATURE(1)                                                                    General Commands Manual                                                                    SWIFT-FORM-SIGNATURE(1)



NAME
       swift-form-signature - compute the expires and signature for OpenStack Swift Form POST middleware


SYNOPSIS
       swift-form-signature path redirect max_file_size max_file_count seconds key


DESCRIPTION
       Tool to compute expires and signature values which can be used to upload objects directly to the Swift from a browser by using the form POST middleware.


OPTIONS
       path   The prefix to use for form uploaded objects. For example: /v1/account/container/object_prefix_ would ensure all form uploads have that path prepended to the browser-given file name.

       redirect
              The URL to redirect the browser to after the uploads have completed.

       max_file_size
              The maximum file size per file uploaded.

       max_file_count
              The maximum number of uploaded files allowed.

       seconds
              The number of seconds from now to allow the form post to begin.

       key    The X-Account-Meta-Temp-URL-Key for the account.


DOCUMENTATION
       More in depth documentation in regards to swift-form-signature and also about OpenStack Swift as a whole can be found at https://docs.openstack.org/swift/latest/ and https://docs.openstack.org



OpenStack Swift                                                                                  August 2016                                                                          SWIFT-FORM-SIGNATURE(1)
