#!/usr/bin/perl  use  strict; use warnings; use v5.10; # for ’//’
use  open  qw/:utf8  :std/;  use  utf8;  use  Config  qw//;   use
File::Find qw//; use File::Spec qw//; use XML::LibXML qw//;

{
  my $have_display;
  BEGIN {
    if (!@ARGV) {
      local $@;
      $have_display = eval ’use Gtk3; Gtk3::init_check ()’;
    }
  }

  my $parser = GirParser‐>new;

  if (!@ARGV && $have_display) {
    my @girs = find_girs ();
    my $gui = GirGUI‐>new ($parser, @girs);
    $gui‐>run;
    exit;
  }

  if (!@ARGV) {
    die    ’Usage:    perli11ndoc    <library    name>[::<element
name>[::<element name>]]’;
  }

  my $pattern = $ARGV[0];
  my ($lib_pattern, @element_patterns) = split /::/, $pattern;

  my $gir = find_gir ($lib_pattern);
  $parser‐>open ($gir);

  if (!@element_patterns) {
    print $parser‐>format_namespace;
  } else {
    print $parser‐>format_search_results (@element_patterns);
  } }

#
‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐

sub find_gir {
  my ($lib_pattern) = @_;

  if ($lib_pattern !~ /^([^−]+)‐?((?:.)?)?$/) {
    die "Cannot recognize the library name0;
  }
  my $name_wanted = $1;
  my $version_wanted = $2;
  if (defined $version_wanted && $version_wanted !~ /./) {
    $version_wanted .= ’.0’;
  }

  my $match_func = sub {
    if (defined $version_wanted) {
      return $_ eq "$name_wanted‐$version_wanted.gir";
    } else {
      return $_ =~ /^Q$name_wanted−+.+.gir$/;
    }
  };
  my @girs = find_girs ($match_func);
  if (@girs == 0) {
    die "Could not find any matching GIR file0;
  }
  if (@girs > 1) {
    my $girs_string = join (’, ’, map { $_‐>{path} } @girs);
    die "Found multiple matching GIR files: $girs_string;  please
be more specific0;
  }

  return $girs[0]‐>{path}; }

sub find_girs {
  my ($match_func) = @_;
  $match_func //= sub { 1 };

  my @prefixes = (’/usr’);
  my @env_vars = (
    {name  =>  ’LD_LIBRARY_PATH’,  extra_depth  =>  1},  # /<pre‐
fix>/lib => /<prefix>
    {name =>  ’GI_TYPELIB_PATH’,  extra_depth  =>  2},  #  /<pre‐
fix>/lib/girepository‐1.0 => /<prefix>
  );
  foreach my $env_var (@env_vars) {
    next unless exists $ENV{$env_var‐>{name}};
    my     @dirs     =     split     /$Config::Config{path_sep}/,
$ENV{$env_var‐>{name}};
    foreach my $dir (@dirs) {
      my @dir_parts = File::Spec‐>splitdir ($dir);
      my $prefix = File::Spec‐>catdir (
        @dir_parts[0 .. ($#dir_parts‐$env_var‐>{extra_depth})]);
      if (‐d $prefix) {
        push @prefixes, Cwd::abs_path ($prefix);
      }
    }
  }
  my %seen;
  my @search_dirs = grep { !$seen{$_}++ && ‐d $_ }
                    map { $_ . ’/share/gir‐1.0’ }
                    @prefixes;

  my @girs;
  File::Find::find (sub {
                      if ($_ =~ m/.gir$/ && $match_func‐>($_)) {
                        push @girs, {path => $File::Find::name,
                                     dir => $File::Find::dir,
                                     file => $_};
                      }
                    }, @search_dirs);

  return @girs; }

#
‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐
#                          ‐‐‐                          GirParser
‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐
#
‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐

package GirParser;

use strict; use warnings;

sub new {
  my ($class) = @_;
  return bless {}, $class }

sub open {
  my ($self, $gir) = @_;

  $self‐>{gir} = $gir;
  $self‐>{parser} = XML::LibXML‐>new;
  $self‐>{dom} = $self‐>{parser}‐>load_xml (location => $gir);

  $self‐>{xpc} = XML::LibXML::XPathContext‐>new;
  $self‐>{xpc}‐>registerNs  (’core’,   ’http://www.gtk.org/intro‐
spection/core/1.0’);

  $self‐>{repository} = $self‐>{dom}‐>documentElement;

  my   $namespace_list  =  $self‐>{xpc}‐>find  (’core:namespace’,
$self‐>{repository});
  if ($namespace_list‐>size != 1) {
    die ’Can only handle a single namespace’;
  }
  $self‐>{namespace} = $namespace_list‐>pop;

  $self‐>{basename} = $self‐>construct_basename; }

sub construct_basename {
  my ($self) = @_;
  my $name = $self‐>find_attribute ($self‐>{namespace}, ’name’);
  my $version = $self‐>find_attribute ($self‐>{namespace},  ’ver‐
sion’);
  $version =~ s/.0$//;
  $version = ’’ if $version eq ’1’;
  return $name . $version; }

#
‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐

sub find_attribute {
  my ($self, $element, $attribute) = @_;
  my $attribute_list = $element‐>find ("@$attribute");
  return undef if $attribute_list‐>size != 1;
  return $attribute_list‐>pop‐>value; }

sub find_full_element_name {
  my ($self, $element) = @_;
  my $name = $self‐>find_attribute ($element, ’name’);
  return () unless defined $name;

  if ($name =~ /./) {
    die  "Unexpected  fully  qualified  name ’$name’ encountered;
aborting0;
  }

  my $package = ’’;
  my $current_element = $element;
  while (1) {
    my $parent = $current_element‐>parentNode;
    last unless defined $parent;
    if ($parent‐>nodeName eq ’namespace’) {
      $package = $self‐>{basename} . ’::’ . $package;
      last;
    }
    $package = $self‐>find_attribute ($parent, ’name’) .  ’::’  .
$package;
    $current_element = $parent;
  }

  my $full_name = $package . $name;
  $package =~ s/::$//;
  return ($package, $name, $full_name); }

sub find_node_by_path {
  my ($self, $path) = @_;

  my  $match_list  =  $self‐>{xpc}‐>find  ($path,  $self‐>{names‐
pace});
  if ($match_list‐>size < 1) {
    die "Cannot find a matching element for the path $path0;
  }
  if ($match_list‐>size > 1) {
    die "Found more  than  one  matching  element  for  the  path
$path0;
  }

  return $match_list‐>pop; }

sub find_parameters_and_return_value {
  my ($self, $element) = @_;

  my (@in, @out);
  my    $parameter_list   =   $self‐>{xpc}‐>find   (’core:parame‐
ters/core:parameter’, $element);
  foreach my $parameter ($parameter_list‐>get_nodelist) {
    my $direction =  $self‐>find_attribute  ($parameter,  ’direc‐
tion’) // ’in’;
    if ($direction eq ’inout’ || $direction eq ’out’) {
      push @out, $parameter;
    }
    if ($direction eq ’inout’ || $direction eq ’in’) {
      push @in, $parameter;
    }
  }

  my $retval = undef;
  my $retval_list = $self‐>{xpc}‐>find (’core:return‐value’, $el‐
ement);
  if ($retval_list‐>size == 1) {
    $retval = $retval_list‐>[0];
    if (defined $retval) {
      if ($self‐>find_type_name ($retval) eq ’none’) {
        $retval = undef;
      }
    }
  }

  return (@in, $retval, @out); }

sub find_type_name {
  my ($self, $element) = @_;

  # arrays
  my $array_list = $self‐>{xpc}‐>find (’core:array’, $element);
  if ($array_list‐>size == 1) {
    my $array = $array_list‐>pop;
    my $prefix = ’reference to array of ’;
    my $child_type_name = $self‐>find_type_name ($array);
    return $prefix . $child_type_name;
  }

  # callbacks
  my $callback_list = $self‐>{xpc}‐>find (’core:callback’,  $ele‐
ment);
  if ($callback_list‐>size == 1) {
    my $callback = $callback_list‐>pop;
    my  ($in,  $retval,  $out)  =  $self‐>find_parameters_and_re‐
turn_value ($callback);
    unshift @$out, $retval if defined $retval;
    my $in_list = join ’, ’, map { $self‐>find_type_name  ($_)  }
@$in;
    my  $out_list = join ’, ’, map { $self‐>find_type_name ($_) }
@$out;
    my $in_text = $in_list ne ’’ ? "in: $in_list" : ’’;
    my $out_text = $out_list ne ’’ ? "; out: $out_list" : ’’;
    return "callback ($in_text$out_text)";
  }

  # bare types
  my $type_list = $self‐>{xpc}‐>find (’core:type’, $element);
  return ’[unknown type]’ unless $type_list‐>size == 1;
  my $type = $type_list‐>pop;
  return $self‐>find_attribute ($type, ’name’); }

#
‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐

sub enumerate_namespace {
  my ($self, $descend) = @_;
  $descend //= 0;

  my @class_and_interface_sub_categories = (
    [Constructors => ’core:constructor’],
    [Methods => ’core:method’],
    [Functions => ’core:function’],
    [Signals => ’glib:signal’],
    [Properties => ’core:property’],
    [Fields => ’core:field’],
    [’Virtual methods’ => ’core:virtual‐method’],
  );

  my @record_sub_categories = (
    [Constructors => ’core:constructor’],
    [Methods => ’core:method’],
    [Functions => ’core:function’],
    [Fields => ’core:field’],
  );

  my @enum_and_bitfield_sub_categories = (
    [Functions => ’core:function’],
  );

  my @categories = (
    [Classes  =>   ’core:class’,   @class_and_interface_sub_cate‐
gories, sub { shift =~ /Accessible$/ }],
    [Interfaces     =>     ’core:interface’,    @class_and_inter‐
face_sub_categories],
    [Records  =>  ’core:record’,  @record_sub_categories,  sub  {
shift =~ /(?:Class|Iface|Interface|Private)$/ }],
    [Enumerations     =>    ’core:enumeration’,    @enum_and_bit‐
field_sub_categories],
    [Bitfields =>  ’core:bitfield’,  @enum_and_bitfield_sub_cate‐
gories],
    [Functions => ’core:function’],
    [Callbacks => ’core:callback’],
    [Constants => ’core:constant’],
    [Aliases  =>  ’core:alias’, undef, sub { shift =~ /_autoptr$/
}],
    [’Classes for accessibility’ => ’core:class’,
     @class_and_interface_sub_categories,
     sub { shift !~ /Accessible$/ }],
    [’Records for object classes’ => ’core:record’,
     @record_sub_categories,
     sub { shift !~ /Class$/ }],
    [’Records for interfaces’ => ’core:record’,
     @record_sub_categories,
     sub { shift !~ /(?:Iface|Interface)$/ }],
  );

  my @results;
  foreach my $category (@categories) {
    my $heading = $category‐>[0];
    my $path = $category‐>[1];
    my $sub_categories = $category‐>[2] // undef;
    my $skip = $category‐>[3] // sub { 0 }; # accept all  by  de‐
fault

    my $list = $self‐>{xpc}‐>find ($path, $self‐>{namespace});
    next if $list‐>size == 0;
    my @entries;
    foreach my $node ($list‐>get_nodelist) {
      my $node_path = $node‐>nodePath;
      my $name = $self‐>find_attribute ($node, ’name’);
      next if $skip‐>($name);

      my @sub_results;
      if ($descend && defined $sub_categories) {
        foreach my $sub_category (@$sub_categories) {
          my $sub_heading = $sub_category‐>[0];
          my $sub_path = $sub_category‐>[1];
          my $sub_list = $self‐>{xpc}‐>find ($sub_path, $node);

          next if $sub_list‐>size == 0;
          my @sub_entries;
          foreach my $sub_node ($sub_list‐>get_nodelist) {
            my $sub_path = $sub_node‐>nodePath;
            my   $sub_name  =  $self‐>find_attribute  ($sub_node,
’name’);
            push @sub_entries, {path => $sub_path,
                                name => $sub_name};
          }

          push @sub_results, [$sub_heading => @sub_entries];
        }
      }

      push @entries, {path => $node_path,
                      name => $name,
                      sub_results => @sub_results};
    }

    next unless @entries;
    push @results, [$heading => @entries];
  }

  return @results; }

sub format_namespace {
  my ($self) = @_;

  my $text = ’’;

  my $name = $self‐>find_attribute ($self‐>{namespace}, ’name’);
  my $version = $self‐>find_attribute ($self‐>{namespace},  ’ver‐
sion’);
  $text  .=  "NAMESPACE$name  $version => " . $self‐>{basename} .
"0;

  my $results = $self‐>enumerate_namespace;
  foreach my $results (@$results) {
    my $heading = uc $results‐>[0];
    my $entries = $results‐>[1];
    next unless @$entries;
    $text .= "$heading0;
    foreach my $entry (@$entries) {
      $text .= ’  ’ . $entry‐>{name} . "0;
    }
    $text .= "0;
  }

  $text =~ s/0Z/0;

  return $text; }

#
‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐

sub format_search_results {
  my ($self, @search_terms) = @_;
  die ’Can only handle up to two search terms’ if @search_terms >
2;

  my $query = @search_terms == 1 ?
    "*[@name=’$search_terms[0]’]" :
    "*[@name=’$search_terms[0]’]/*[@name=’$search_terms[1]’]";

  my  $match_list  =  $self‐>{xpc}‐>find  ($query, $self‐>{names‐
pace});
  if ($match_list‐>size == 0) {
    die "Cannot find a matching  element  for  the  search  terms
@search_terms0;
  }
  my @matches = $match_list‐>get_nodelist;
  if (@matches > 1) {
    my $matches_string =
      join (’, ’, map { $self‐>format_full_element_name ($_) }
            @matches);
    die  "Found two many matches: $matches_string; please be more
specific0;
  }

  my $match = $matches[0];
  return $self‐>format_node ($match); }

sub format_node_by_path {
  my ($self, $path) = @_;
  my $node = $self‐>find_node_by_path ($path);
  return $self‐>format_node ($node); }

sub format_node_name_by_path {
  my ($self, $path) = @_;
  my $node = $self‐>find_node_by_path ($path);
  return $self‐>format_full_element_name ($node); }

sub format_node {
  my ($self, $node) = @_;

  my %categories = (
    alias => ’format_alias’,
    bitfield => ’format_bitfield’,
    callback => ’format_callback’,
    class => ’format_class’,
    constant => ’format_constant’,
    constructor => ’format_constructor’,
    enumeration => ’format_enumeration’,
    field => ’format_field’,
    function => ’format_function’,
    method => ’format_method’,
    property => ’format_property’,
    interface => ’format_interface’,
    record => ’format_record’,
    ’glib:signal’ => ’format_signal’,
    ’virtual‐method’ => ’format_virtual_method’,
  );

  my $type = $node‐>nodeName;
  my $handler = $categories{$type};
  if (!defined $handler) {
    die "Unknown node type ’$type’ encountered; aborting0;
  }
  return $self‐>$handler ($node); }

#
‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐

sub format_alias {
  my ($self, $element) = @_;
  my $text = ’’;
  my $full_name = $self‐>format_full_element_name ($element);
  my $type_name = $self‐>find_type_name ($element);
  my $full_type_name = $self‐>format_full_type_name ($type_name);
  $text .= "ALIAS$full_name = $full_type_name0;
  $text .= $self‐>format_description ($element);
  return $text; }

#
‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐

sub format_bitfield {
  my ($self, $element) = @_;
  return $self‐>format_bitfield_and_enumeration ($element,  ’BIT‐
FIELD’); }

sub format_enumeration {
  my ($self, $element) = @_;
  return  $self‐>format_bitfield_and_enumeration ($element, ’ENU‐
MERATION’); }

sub format_bitfield_and_enumeration {
  my ($self, $element, $heading) = @_;
  my $text = ’’;
  my $full_name = $self‐>format_full_element_name ($element);
  $text .= "$heading$full_name0;
  $text .= $self‐>format_description ($element);
  $text .= $self‐>format_sub_members ($element);
  $text .= $self‐>format_sub_functions ($element, ’FUNCTIONS’);
  return $text; }

#
‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐

sub format_callable {
  my ($self, $element, $heading, $synopsis_format, $flags_format‐
ter) = @_;
  $flags_formatter //= ’format_callable_flags’;

  my $text = ’’;

  my   ($package,   $name,  $full_name)  =  $self‐>find_full_ele‐
ment_name ($element);
  my $flags = $self‐>$flags_formatter ($element);
  $text .= "$heading$full_name$flags0;

  my  ($in,  $retval,  $out)   =   $self‐>find_parameters_and_re‐
turn_value ($element);

  # ‐‐‐ synopsis ‐‐‐
  my @in_names = map { ’$’ . $self‐>find_attribute ($_, ’name’) }
@$in;
  my @out_names = map { ’$’ . $self‐>find_attribute ($_,  ’name’)
} @$out;
  if (defined $retval) {
    unshift @out_names, ’$retval’;
  }

  my $in_list = join ’, ’, @in_names;
  my $in_list_pre_comma = @in_names > 0 ? ", $in_list" : ’’;
  my $in_list_post_comma = @in_names > 0 ? "$in_list, " : ’’;
  my $out_list = join ’, ’, @out_names;
  my   $out_list_parens  =  @out_names  >  1  ?  "($out_list)"  :
$out_list;
  my $out_list_assign = @out_names > 0 ? "$out_list_parens = "  :
’’;

  my $synopsis = $synopsis_format;
  $synopsis =~ s/]/$package/g;
  $synopsis =~ s/]/$name/g;
  $synopsis =~ s/]/uc $name/ge;
  $synopsis =~ s/]/$full_name/g;
  $synopsis =~ s/]/$in_list/g;
  $synopsis =~ s/]/$in_list_pre_comma/g;
  $synopsis =~ s/]/$in_list_post_comma/g;
  $synopsis =~ s/]/$out_list/g;
  $synopsis =~ s/]/$out_list_parens/g;
  $synopsis =~ s/]/$out_list_assign/g;

  $text .= "0YNOPSIS$synopsis0;

  # ‐‐‐ description ‐‐‐
  $text .= $self‐>format_description ($element);

  # ‐‐‐ in ‐‐‐
  if (@$in) {
    $text .= "0ARAMETERS0;
    foreach my $parameter (@$in) {
      my $name = $self‐>find_attribute ($parameter, ’name’);
      my $type_name = $self‐>find_type_name ($parameter);
      my     $full_type_name    =    $self‐>format_full_type_name
($type_name);
      $text .= "  · $name: $full_type_name0;
      my $doc = $self‐>format_docs ($parameter, ’    ’);
      if (defined $doc) {
        $text .= "$doc0;
      }
      $text .= "0;
    }
    $text =~ s/0Z/0;
  }

  # ‐‐‐ retval & out ‐‐‐
  my $retval_type_name = ’none’;
  if (defined $retval) {
    $retval_type_name = $self‐>find_type_name ($retval);
  }
  if ($retval_type_name ne ’none’ || @$out) {
    $text .= "0ETURN VALUES0;
    if ($retval_type_name ne ’none’) {
      my $full_retval_type_name =
        $self‐>format_full_type_name ($retval_type_name);
      $text .= "  · $full_retval_type_name0;
      my $doc = $self‐>format_docs ($retval, ’    ’);
      if (defined $doc) {
        $text .= "$doc0;
      }
    }
    if (@$out) {
      foreach my $parameter (@$out) {
        my $name = $self‐>find_attribute ($parameter, ’name’);
        my $type_name = $self‐>find_type_name ($parameter);
        my   $full_type_name    =    $self‐>format_full_type_name
($type_name);
        $text .= "  · $name: $full_type_name0;
        my $doc = $self‐>format_docs ($parameter, ’    ’);
        if (defined $doc) {
          $text .= "$doc0;
        }
      }
    }
    $text =~ s/0Z/0;
  }

  return $text; }

sub format_callback {
  my ($self, $element) = @_;
  my $synopsis_format = <<’__EOS__’; sub {
    my ([[IN_LIST]]) = @_;
    ...
    return [[OUT_LIST_PARENS]];
  } __EOS__
  return  $self‐>format_callable  ($element,  ’CALLBACK’, $synop‐
sis_format); }

sub format_constructor {
  my ($self, $element) = @_;
  my  $synopsis_format   =   ’$object   =   [[PACKAGE]]‐>[[NAME]]
([[IN_LIST]])’;
  return $self‐>format_callable ($element, ’CONSTRUCTOR’, $synop‐
sis_format); }

sub format_function {
  my ($self, $element) = @_;
  my   $synopsis_format    =    ’[[OUT_LIST_ASSIGN]][[FULL_NAME]]
([[IN_LIST]])’;
  return  $self‐>format_callable  ($element,  ’FUNCTION’, $synop‐
sis_format); }

sub format_method {
  my ($self, $element) = @_;
  my  $synopsis_format  =   ’[[OUT_LIST_ASSIGN]]$object‐>[[NAME]]
([[IN_LIST]])’;

  # Treat methods of class structs as functions.
  {
    my $parent = $element‐>parentNode;
    if ($parent‐>nodeName eq ’record’ &&
        defined  $self‐>find_attribute  ($parent, ’glib:is‐gtype‐
struct‐for’))
    {
      $synopsis_format    =     ’[[OUT_LIST_ASSIGN]][[FULL_NAME]]
($package[[IN_LIST_PRE_COMMA]])’;
    }
  }

  return   $self‐>format_callable  ($element,  ’METHOD’,  $synop‐
sis_format); }

sub format_signal {
  my ($self, $element) = @_;
  my  $synopsis_format  =  <<’__EOS__’;   $object‐>signal_connect
(’[[NAME]]’ => sub {
    my ($object, [[IN_LIST_POST_COMMA]]$data) = @_;
    ...
    return [[OUT_LIST_PARENS]];
  }, $data); __EOS__
  return $self‐>format_callable ($element,
                                 ’SIGNAL’,
                                 $synopsis_format,
                                 ’format_signal_flags’); }

sub format_virtual_method {
  my ($self, $element) = @_;
  my $synopsis_format = <<’__EOS__’; sub [[NAME_UC]] {
    my ($object[[IN_LIST_PRE_COMMA]]) = @_;
    ...
    return [[OUT_LIST_PARENS]];
  } __EOS__
  return $self‐>format_callable ($element,
                                 ’VIRTUAL METHOD’,
                                 $synopsis_format,
                                 ’format_virtual_method_flags’);
}

#
‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐

sub format_class {
  my ($self, $element) = @_;

  my $format_hierarchy_and_interfaces = sub {
    my @parents;
    my $current_element = $element;
    while (1) {
      my $parent_name = $self‐>find_attribute  ($current_element,
’parent’);
      last unless defined $parent_name;
      unshift   @parents,   $self‐>format_full_type_name   ($par‐
ent_name);

      # Stop if the parent is fully qualified, i.e., if it points
elsewhere.
      last if $parent_name =~ /./;

      my $parent_list =
        $self‐>{xpc}‐>find ("core:class[@name=’$parent_name’]",
                            $self‐>{namespace});
      if ($parent_list‐>size != 1) {
        die  "Found  no  or  too  many  classes  with name ’$par‐
ent_name’0;
      }
      $current_element = $parent_list‐>pop;
    }

    my @children;
    my $name = $self‐>find_attribute ($element, ’name’);
    my $children_list =
      $self‐>{xpc}‐>find ("core:class[@parent=’$name’]",
                          $self‐>{namespace});
    foreach my $child ($children_list‐>get_nodelist) {
      push @children, $self‐>format_full_element_name ($child);
    }

    my $hierarchy_text = ’’;
    if (@parents || @children) {
      push @parents, $self‐>format_full_element_name ($element);
      $hierarchy_text = "0IERARCHY0;
      my $hook = ’╰── ’; # thanks, devhelp
      my $spacer = ’ ’ x length $hook;
      for (my $i = 0; $i < @parents; $i++) {
        $hierarchy_text .=
          ’  ’ .
          ($i > 0 ? (($spacer x ($i‐1)) . $hook) : ’’) .
          $parents[$i] . "0;
      }
      foreach my $child (@children) {
        $hierarchy_text .=
          ’  ’ .
          $spacer x $#parents . $hook .
          $child . "0;
      }
    }

    my $impl_list = $self‐>{xpc}‐>find (’core:implements’,  $ele‐
ment);
    my $impl_text =
      $self‐>format_full_type_names ($impl_list, ’IMPLEMENTED IN‐
TERFACES’);

    return $hierarchy_text . $impl_text;
  };

  return $self‐>format_class_and_interface ($element, ’CLASS’,
                                            $format_hierar‐
chy_and_interfaces); }

sub format_interface {
  my ($self, $element) = @_;

  my $format_prerequisites_and_implementations = sub {
    my  $prereq_list  =  $self‐>{xpc}‐>find (’core:prerequisite’,
$element);
    my $prereq_text =
      $self‐>format_full_type_names   ($prereq_list,   ’PREREQUI‐
SITES’);

    my $name = $self‐>find_attribute ($element, ’name’);
    my $impl_list =
      $self‐>{xpc}‐>find               ("core:class[./core:imple‐
ments[@name=’$name’]]",
                          $self‐>{namespace});
    my $impl_text =
      $self‐>format_full_type_names ($impl_list, ’KNOWN IMPLEMEN‐
TATIONS’);

    return $prereq_text . $impl_text;
  };

  return   $self‐>format_class_and_interface  ($element,  ’INTER‐
FACE’,
                                            $format_prerequi‐
sites_and_implementations); }

sub format_class_and_interface {
  my ($self, $element, $heading, $intro) = @_;
  my $text = ’’;
  my $full_name = $self‐>format_full_element_name ($element);
  $text .= "$heading$full_name0;
  $text .= $intro‐>();
  $text .= $self‐>format_description ($element);
  $text .= $self‐>format_sub_constructors ($element);
  $text .= $self‐>format_sub_methods ($element);
  $text  .=  $self‐>format_sub_functions  ($element, ’CLASS FUNC‐
TIONS’);
  $text .= $self‐>format_sub_signals ($element);
  $text .= $self‐>format_sub_properties ($element);
  $text .= $self‐>format_sub_fields ($element);
  $text .= $self‐>format_sub_virtual_methods ($element);
  return $text; }

#
‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐

sub format_constant {
  my ($self, $element) = @_;
  my $text = ’’;
  my $full_name = $self‐>format_full_element_name ($element);
  my $value = $self‐>find_attribute ($element, ’value’);
  my $type_name = $self‐>find_type_name ($element);
  my $full_type_name = $self‐>format_full_type_name ($type_name);
  $text .= "CONSTANT$full_name = $value ($full_type_name)0;
  $text .= $self‐>format_description ($element);
  return $text; }

#
‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐

sub format_field {
  my ($self, $element) = @_;
  my $text = ’’;
  my $full_name = $self‐>format_full_element_name ($element);
  my $type_name = $self‐>find_type_name ($element);
  my $full_type_name = $self‐>format_full_type_name ($type_name);
  my $flags = $self‐>format_field_flags ($element);
  $text .= "FIELD$full_name: $full_type_name$flags0;
  $text .= $self‐>format_description ($element);
  return $text; }

#
‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐

sub format_property {
  my ($self, $element) = @_;
  my $text = ’’;
  my $full_name = $self‐>format_full_element_name ($element);
  my $type_name = $self‐>find_type_name ($element);
  my $full_type_name = $self‐>format_full_type_name ($type_name);
  my $flags = $self‐>format_property_flags ($element);
  $text .= "PROPERTY$full_name: $full_type_name$flags0;
  $text .= $self‐>format_description ($element);
  return $text; }

#
‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐

sub format_record {
  my ($self, $element) = @_;
  my $text = ’’;
  my $full_name = $self‐>format_full_element_name ($element);
  $text .= "RECORD$full_name0;
  $text .= $self‐>format_description ($element);
  $text .= $self‐>format_sub_fields ($element);
  $text .= $self‐>format_sub_constructors ($element);
  $text .= $self‐>format_sub_methods ($element);
  $text .= $self‐>format_sub_functions ($element, ’FUNCTIONS’);
  return $text; }

#
‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐

sub format_sub_constructors {
  my ($self, $element) = @_;
  my $text = ’’;
  my $ctor_list = $self‐>{xpc}‐>find  (’core:constructor’,  $ele‐
ment);
  if ($ctor_list‐>size > 0) {
    $text .= "0ONSTRUCTORS0;
    foreach my $ctor ($ctor_list‐>get_nodelist) {
      my $name = $self‐>find_attribute ($ctor, ’name’);
      my $flags = $self‐>format_callable_flags ($ctor,
                                                qw/introspectable
version/);
      $text .= "  · $name$flags0;
    }
  }
  return $text; }

sub format_sub_fields {
  my ($self, $element) = @_;
  my $text = ’’;
  my $field_list = $self‐>{xpc}‐>find (’core:field’, $element);
  if ($field_list‐>size > 0) {
    $text .= "0IELDS0;
    foreach my $field ($field_list‐>get_nodelist) {
      my $name = $self‐>find_attribute ($field, ’name’);
      my $type_name = $self‐>find_type_name ($field);
      my    $full_type_name    =     $self‐>format_full_type_name
($type_name);
      my  $flags  =  $self‐>format_field_flags ($field, qw/intro‐
spectable/);
      $text .= "  · $name: $full_type_name$flags0;
    }
  }
  return $text; }

sub format_sub_functions {
  my ($self, $element, $heading) = @_;
  my $text = ’’;
  my $function_list = $self‐>{xpc}‐>find (’core:function’,  $ele‐
ment);
  if ($function_list‐>size > 0) {
    $text .= "0heading0;
    foreach my $function ($function_list‐>get_nodelist) {
      my $name = $self‐>find_attribute ($function, ’name’);
      my $flags = $self‐>format_callable_flags ($function,
                                                qw/introspectable
version/);
      $text .= "  · $name$flags0;
    }
  }
  return $text; }

sub format_sub_members {
  my ($self, $element) = @_;
  my $text = ’’;
  my $member_list = $self‐>{xpc}‐>find (’core:member’, $element);
  if ($member_list‐>size > 0) {
    $text .= "0EMBERS0;
    foreach my $member ($member_list‐>get_nodelist) {
      my $name = $self‐>find_attribute ($member, ’name’);
      my $value = $self‐>find_attribute ($member, ’value’);
      $text .= " · $name = $value0;
      my $doc = $self‐>format_docs ($member, ’    ’);
      if (defined $doc) {
        $text .= "$doc0;
      }
    }
  }
  return $text; }

sub format_sub_methods {
  my ($self, $element) = @_;
  my $text = ’’;
  my $method_list = $self‐>{xpc}‐>find (’core:method’, $element);
  if ($method_list‐>size > 0) {
    $text .= "0ETHODS0;
    foreach my $method ($method_list‐>get_nodelist) {
      my $name = $self‐>find_attribute ($method, ’name’);
      my $flags = $self‐>format_callable_flags ($method,
                                                qw/introspectable
version/);
      $text .= "  · $name$flags0;
    }
  }
  return $text; }

sub format_sub_properties {
  my ($self, $element) = @_;
  my $text = ’’;
  my  $property_list = $self‐>{xpc}‐>find (’core:property’, $ele‐
ment);
  if ($property_list‐>size > 0) {
    $text .= "0ROPERTIES0;
    foreach my $property ($property_list‐>get_nodelist) {
      my $name = $self‐>find_attribute ($property, ’name’);
      my $type_name = $self‐>find_type_name ($property);
      my    $full_type_name    =     $self‐>format_full_type_name
($type_name);
      my   $flags   =   $self‐>format_property_flags  ($property,
qw/version/);
      $text .= "  · $name: $full_type_name$flags0;
    }
  }
  return $text; }

sub format_sub_signals {
  my ($self, $element) = @_;
  my $text = ’’;
  my $signal_list = $self‐>{xpc}‐>find (’glib:signal’, $element);
  if ($signal_list‐>size > 0) {
    $text .= "0IGNALS0;
    foreach my $signal ($signal_list‐>get_nodelist) {
      my $name = $self‐>find_attribute ($signal, ’name’);
      my $flags =  $self‐>format_signal_flags  ($signal,  qw/ver‐
sion/);
      $text .= "  · $name$flags0;
    }
  }
  return $text; }

sub format_sub_virtual_methods {
  my ($self, $element) = @_;
  my $text = ’’;
  my  $vfunc_list  =  $self‐>{xpc}‐>find  (’core:virtual‐method’,
$element);
  if ($vfunc_list‐>size > 0) {
    $text .= "0IRTUAL METHODS0;
    foreach my $vfunc ($vfunc_list‐>get_nodelist) {
      my $name = $self‐>find_attribute ($vfunc, ’name’);
      my $flags = $self‐>format_virtual_method_flags ($vfunc);
      $text .= "  · $name$flags0;
    }
  }
  return $text; }

#
‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐

sub format_deprecation_docs {
  my ($self, $element) = @_;
  my $deprecated = $self‐>find_attribute ($element, ’deprecated’)
// 0;
  return undef unless $deprecated;

  my $text = ’’;

  my $version = $self‐>find_attribute ($element, ’deprecated‐ver‐
sion’);
  if (defined $version) {
    $text .= "Deprecated since: $version.";
  }

  my $doc_dep_list =  $self‐>{xpc}‐>find  (’core:doc‐deprecated’,
$element);
  if ($doc_dep_list‐>size == 1) {
    $text .= ’  ’ . $doc_dep_list‐>pop‐>textContent;
  }

  return undef if $text eq ’’;
  return $text; }

sub format_description {
  my ($self, $element) = @_;
  my $docs = $self‐>format_docs ($element);
  return defined $docs ? "0ESCRIPTION0docs0 : ’’; }

sub format_docs {
  my ($self, $element, $indent) = @_;
  $indent //= ’  ’;

  my $text = ’’;

  # The normal docs.
  my $docs_list = $self‐>{xpc}‐>find (’core:doc’, $element);
  if ($docs_list‐>size == 1) {
    $text .= $docs_list‐>pop‐>textContent;
  }

  # The version constraint.
  my $ver = $self‐>format_version_constraint ($element);
  $text .= "0ver0 if defined $ver;

  # The deprecation docs.
  my $dep = $self‐>format_deprecation_docs ($element);
  $text .= "0dep0 if defined $dep;

  return undef if $text eq ’’;

  # Extract code blocks so that they are not wrapped.
  my $code_block_pattern = qr//s;
  my $empty_code_block = ’|[]|’;
  my $empty_code_block_pattern = qr//;
  my @code_blocks = $text =~ m/$code_block_pattern/g;
  $text =~ s/$code_block_pattern/$empty_code_block/g;

  #  Remove  leading white space as fill() otherwise takes it for
starting a new
  # paragraph.  Do this after the code block extraction  to  pre‐
serve their
  # indentation.
  $text =~ s/^[ ]+//mg;

  require Text::Wrap;
  my   $formatted_text   =  Text::Wrap::fill  ($indent,  $indent,
$text);

  while ($formatted_text =~ m/$empty_code_block_pattern/g) {
    my $code_block = shift @code_blocks;
    $code_block =~ s/^/$indent/mg;
    my $divider = ’‐’ x (76‐length($indent));
    my $formatted_code_block =
      "0indent$divider0code_block0indent$divider";
    $formatted_text =~
      s/(?:0?(?:$indent)?$empty_code_block_pattern/$format‐
ted_code_block/;
  }

  return $formatted_text; }

sub format_full_element_name {
  my ($self, $element) = @_;
  my  (undef,  undef, $full_name) = $self‐>find_full_element_name
($element);
  return $full_name; }

sub format_full_type_name {
  my ($self, $name) = @_;
  if ($name =~ /./) { # fully qualified
    $name =~ s/./::/g;
    return $name;
  }
  if ($name =~ /^[A‐Z]/) { # local
    return $self‐>{basename} . ’::’ . $name;
  }
  return $name; # global }

sub format_full_type_names {
  my ($self, $list, $heading) = @_;
  my $text = ’’;
  if ($list‐>size > 0) {
    $text .= "0heading0;
    foreach my $node ($list‐>get_nodelist) {
      my $type_name = $self‐>find_attribute ($node, ’name’);
      my    $full_type_name    =     $self‐>format_full_type_name
($type_name);
      $text .= "  · $full_type_name0;
    }
  }
  return $text; }

sub format_version_constraint {
  my ($self, $element) = @_;
  my $version = $self‐>find_attribute ($element, ’version’);
  return undef if !defined $version;
  return "Since: $version."; }

#
‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐

sub format_flags {
  my ($self, $element, $available, $wanted) = @_;
  $wanted //= [];

  my @texts;
  foreach my $flag (@$available) {
    my $name = $flag‐>[0];
    my $default = $flag‐>[1];
    my $formatter = $flag‐>[2];

    if (@$wanted) {
      next unless grep { $_ eq $name } @$wanted;
    }

    my  $value  = $self‐>find_attribute ($element, $name) // $de‐
fault;
    my $text = $formatter‐>($value);
    push @texts, $text if defined $text;
  }

  return ’’ unless @texts;
  return ’ [’ . join (’, ’, @texts) . ’]’; }

sub format_callable_flags {
  my ($self, $element, @wanted) = @_;

  # name, default, formatter
  my @available = (
    [’introspectable’, 1,     sub { !$_[0] ? ’NOT INTROSPECTABLE’
: undef }],
    [’deprecated’,      0,     sub { $_[0] ? "deprecated" : undef
}],
    [’moved‐to’,       undef, sub { defined  $_[0]  ?  "moved  to
$_[0]" : undef }],
    [’shadowed‐by’,     undef, sub { defined $_[0] ? "shadowed by
$_[0]" : undef }], # FIXME: Format $_[0] properly.
    [’throws’,         0,     sub { $_[0] ? "throws" : undef }],
    [’version’,        undef, sub { defined  $_[0]  ?  "available
since $_[0]" : undef }],
    [’shadows’,         undef,  sub  {  defined  $_[0] ? "shadows
$_[0]" : undef }],     # FIXME: Format $_[0] properly.
  );

  return $self‐>format_flags ($element, @available, @wanted); }

sub format_field_flags {
  my ($self, $element, @wanted) = @_;

  # name, default, formatter
  my @available = (
    [’introspectable’, 1, sub { !$_[0] ? ’NOT  INTROSPECTABLE’  :
undef }],
    [’readable’,       1, sub { $_[0] ? ’readable’ : undef }],
    [’writable’,       1, sub { $_[0] ? ’writable’ : undef }],
  );

  return $self‐>format_flags ($element, @available, @wanted); }

sub format_property_flags {
  my ($self, $element, @wanted) = @_;
  my @available = (
    [’deprecated’, 0,     sub { $_[0] ? "deprecated" : undef }],
    [’version’,     undef, sub { defined $_[0] ? "available since
$_[0]" : undef }],
    [’readable’,   1,     sub { $_[0] ? ’readable’ : undef }],
    [’writable’,   0,     sub { $_[0] ? ’writable’ : undef }],
  );
  return $self‐>format_flags ($element, @available, @wanted); }

sub format_signal_flags {
  my ($self, $element, @wanted) = @_;

  # name, default, formatter
  my @available = (
    [’deprecated’, 0,     sub { $_[0] ? "deprecated" : undef }],
    [’version’,    undef, sub { defined $_[0] ? "available  since
$_[0]" : undef }],
    [’when’,        undef,  sub { defined $_[0] ? "$_[0]" : undef
}],
    [’no‐recurse’, 0,     sub { $_[0] ? "no recurse" : undef }],
    [’detailed’,   0,     sub { $_[0] ? "detailed" : undef }],
  );

  return $self‐>format_flags ($element, @available, @wanted); }

sub format_virtual_method_flags {
  my ($self, $element, @wanted) = @_;
  my $name = $self‐>find_attribute ($element, ’name’);
  my @available = (
    [’introspectable’, 1,     sub { !$_[0] ? ’NOT INTROSPECTABLE’
: undef }],
    [’invoker’,         undef,  sub  {  defined $_[0] && $_[0] ne
$name ? "invoked by $_[0]" : undef }],
    [’version’,        undef, sub { defined  $_[0]  ?  "available
since $_[0]" : undef }],
  );
  return $self‐>format_flags ($element, @available, @wanted); }

#
‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐
#                            ‐‐‐                           GirGUI
‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐
#
‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐

package GirGUI;

use strict; use warnings; use File::Basename qw//;

sub TRUE () {1} sub FALSE () {0}

sub  FILE_MENU_COL_TEXT  () { 0 } sub FILE_MENU_COL_FILE () { 1 }
sub FILE_MENU_COL_DIR () { 2 } sub FILE_MENU_COL_PATH ()  {  3  }
sub FILE_MENU_COL_IS_SENSITIVE () { 4 }

sub GIR_VIEW_COL_TEXT () { 0 } sub GIR_VIEW_COL_PATH () { 1 } sub
GIR_VIEW_COL_IS_CATEGORY () { 2 } sub GIR_VIEW_COL_IS_VISIBLE  ()
{ 3 }

sub new {
  my ($class, $parser, @girs) = @_;

  if (!Gtk3::CHECK_VERSION (3, 10, 0)) {
    die "Need gtk+ >= 3.10 for the GUI0;
  }

  my $self = bless {
    parser => $parser,
  }, $class;

  my $window = Gtk3::Window‐>new;

  $self‐>setup_file_menu (@girs);
  $self‐>setup_gir_view;
  $self‐>setup_search_entry;
  $self‐>setup_path_bar;
  $self‐>setup_result_view;

  my $gir_view_window = Gtk3::ScrolledWindow‐>new;
  $gir_view_window‐>add ($self‐>{gir_view});

  my $result_view_window = Gtk3::ScrolledWindow‐>new;
  $result_view_window‐>add ($self‐>{result_view});

  my $side_box = Gtk3::Box‐>new (’vertical’, 2);
  $side_box‐>pack_start ($self‐>{file_menu}, FALSE, FALSE, 0);
  $side_box‐>pack_start ($gir_view_window, TRUE, TRUE, 0);
  $side_box‐>pack_start ($self‐>{search_entry}, FALSE, FALSE, 0);
  $side_box‐>set (margin => 2);

  my $result_box = Gtk3::Box‐>new (’vertical’, 0);
  $result_box‐>pack_start ($self‐>{path_bar}, FALSE, FALSE, 0);
  $result_box‐>pack_start ($result_view_window, TRUE, TRUE, 0);

  my $paned = Gtk3::Paned‐>new (’horizontal’);
  $paned‐>pack1 ($side_box, TRUE, TRUE);
  $paned‐>pack2 ($result_box, TRUE, TRUE);
  $paned‐>set_position (300);

  $window‐>add ($paned);
  $window‐>signal_connect (delete_event => sub { $self‐>quit; });
  $window‐>set_default_geometry (900, 800);

  my $accel_group = Gtk3::AccelGroup‐>new;
  $accel_group‐>connect  (Gtk3::Gdk::KEY_q  (), qw/control‐mask/,
[], sub {
    $self‐>quit;
    return Gtk3::EVENT_STOP ();
  });
  $accel_group‐>connect (Gtk3::Gdk::KEY_k  (),  qw/control‐mask/,
[], sub {
    $self‐>{search_entry}‐>grab_focus;
    return Gtk3::EVENT_STOP ();
  });
  $window‐>add_accel_group ($accel_group);

  $self‐>{window} = $window;

  return $self; }

sub filter_gir_view {
  my ($self, $criterion) = @_;
  my $view = $self‐>{gir_view};
  my $model = $self‐>{gir_model};
  my $filter_model = $self‐>{gir_filter_model};

  if (!defined $criterion || $criterion eq ’’) {
    # Make everything visible.
    $model‐>foreach (sub {
      my (undef, undef, $iter) = @_;
      $model‐>set ($iter, GIR_VIEW_COL_IS_VISIBLE, TRUE);
      return FALSE; # continue
    });

    # Scroll to selected element.
    my $selection = $view‐>get_selection;
    my  ($selected_model,  $selected_iter)  = $selection‐>get_se‐
lected;
    if (defined $selected_iter) {
      my  $selected_path  =  $selected_model‐>get_path  ($select‐
ed_iter);
      $view‐>scroll_to_cell  ($selected_path,  undef, FALSE, 0.5,
0.5);
    }
  } else {
    my $re;
    if ($criterion =~ m|1) {
      $criterion =~ s|1$1|;
      $re = qr/$criterion/;
    } else {
      $re = qr/Q$criterioni;
    }

    my $check_tree;
    $check_tree = sub {
      my ($iter) = @_;
      my @children = map { $model‐>iter_nth_child ($iter, $_) }
                         0..$model‐>iter_n_children ($iter);
      foreach my $child (@children) {
        my ($text, $is_cat) = $model‐>get ($child,
                                           GIR_VIEW_COL_TEXT,
                                           GIR_VIEW_COL_IS_CATE‐
GORY);
        if ($is_cat || $text !~ $re) { # no match
          $model‐>set ($child, GIR_VIEW_COL_IS_VISIBLE, FALSE);
          $check_tree‐>($child); # descend
        } else { # match
          # Make the element and all its parents visible.
          my $cur = $child;
          do {
            $model‐>set ($cur, GIR_VIEW_COL_IS_VISIBLE, TRUE);
          } while (defined ($cur = $model‐>iter_parent ($cur)));

          # Expand the matching element and all its parents.
          $view‐>expand_to_path (
            $filter_model‐>convert_child_path_to_path (
              $model‐>get_path ($child)));

          #  No need to descend as we want all children of match‐
ing elements to
          # be visible.  (All elements are visible by default.)
        }
      }
    };
    $check_tree‐>(undef); # start with the virtual root node
  } }

sub display_results {
  my ($self, $results) = @_;
  $self‐>{result_buffer}‐>set_text ($results); }

sub run {
  my ($self) = @_;
  $self‐>{window}‐>show_all;
  Gtk3::main (); }

sub setup_file_menu {
  my ($self, @girs) = @_;

  my $file_model = Gtk3::TreeStore‐>new (qw/Glib::String
                                            Glib::String
                                            Glib::String
                                            Glib::String
                                            Glib::Boolean/);
  my $file_menu = Gtk3::ComboBox‐>new_with_model ($file_model);
  my $renderer = Gtk3::CellRendererText‐>new;
  $file_menu‐>pack_start ($renderer, TRUE);
  $file_menu‐>set_attributes ($renderer,
                              text => FILE_MENU_COL_TEXT,
                              sensitive =>  FILE_MENU_COL_IS_SEN‐
SITIVE);
  $file_menu‐>set_id_column (FILE_MENU_COL_PATH);

  my $prompt = ’<Select GIR>’;
  $file_model‐>set ($file_model‐>append,
                    FILE_MENU_COL_TEXT, $prompt,
                    FILE_MENU_COL_IS_SENSITIVE, FALSE);
  $file_menu‐>set_active (0);

  my %dirs;
  $dirs{$_‐>{dir}}++ for @girs;
  my $n_dirs = scalar keys %dirs;
  foreach my $gir (sort { $a‐>{file} cmp $b‐>{file} } @girs) {
    my    $text    =   File::Basename::fileparse   ($gir‐>{file},
qr/.gir$/);
    if ($n_dirs > 1) {
      my $dir = $gir‐>{dir};
      $dir =~ s|/share/gir‐1.0$||;
      $text .= ’ (’ . $dir . ’)’;
    }
    $file_model‐>set ($file_model‐>append,
                      FILE_MENU_COL_TEXT, $text,
                      FILE_MENU_COL_FILE, $gir‐>{file},
                      FILE_MENU_COL_DIR, $gir‐>{dir},
                      FILE_MENU_COL_PATH, $gir‐>{path},
                      FILE_MENU_COL_IS_SENSITIVE, TRUE);
  }

  $file_menu‐>signal_connect (changed => sub {
    my (undef, $iter) = $file_menu‐>get_active_iter;
    $self‐>{parser}‐>open        ($file_model‐>get        ($iter,
FILE_MENU_COL_PATH));
    $self‐>update_gir_view;
  });

  $self‐>{file_menu} = $file_menu; }

sub setup_gir_view {
  my ($self) = @_;

  my $gir_model = Gtk3::TreeStore‐>new (qw/Glib::String
                                           Glib::String
                                           Glib::Boolean
                                           Glib::Boolean/);
  my $gir_filter_model = Gtk3::TreeModelFilter‐>new ($gir_model);
  $gir_filter_model‐>set_visible_column    (GIR_VIEW_COL_IS_VISI‐
BLE);

  my $gir_view = Gtk3::TreeView‐>new_with_model ($gir_filter_mod‐
el);
  $gir_view‐>insert_column_with_attributes (
    GIR_VIEW_COL_TEXT, ’Element’,
    Gtk3::CellRendererText‐>new,
    text => GIR_VIEW_COL_TEXT);
  $gir_view‐>set_headers_visible (FALSE);

  $gir_view‐>signal_connect (key_press_event => sub {
    my (undef, $event) = @_;
    if ($event‐>keyval == Gtk3::Gdk::KEY_Left () ||
        $event‐>keyval == Gtk3::Gdk::KEY_Right ()) {
      my $selection = $gir_view‐>get_selection;
      my ($model, $iter) = $selection‐>get_selected;
      if (defined $iter) {
        my $path = $model‐>get_path ($iter);
        if ($event‐>keyval == Gtk3::Gdk::KEY_Left ()) {
          $gir_view‐>collapse_row ($path);
        } else {
          $gir_view‐>expand_row ($path, FALSE);
        }
      }
      return Gtk3::EVENT_STOP ();
    }
    return Gtk3::EVENT_PROPAGATE ();
  });

  $gir_view‐>get_selection‐>signal_connect (changed => sub {
    $self‐>update_results_from_selection
      unless $self‐>{suppress_gir_view_selection_changes};
  });

  $self‐>{gir_model} = $gir_model;
  $self‐>{gir_filter_model} = $gir_filter_model;
  $self‐>{gir_view} = $gir_view; }

sub setup_path_bar {
  my ($self) = @_;
  my $path_bar = PathBar‐>new (orientation => ’horizontal’, spac‐
ing => 2);
  $path_bar‐>set_update_func (sub {
    my ($name, $path) = @_;
    $self‐>update_results ($path);
  });
  $self‐>{path_bar} = $path_bar; }

sub setup_search_entry {
  my ($self) = @_;

  my $search_entry = Gtk3::SearchEntry‐>new;
  $search_entry‐>signal_connect (search_changed => sub {
    $self‐>filter_gir_view ($search_entry‐>get_text);
  });

  $self‐>{search_entry} = $search_entry; }

sub setup_result_view {
  my ($self) = @_;

  my $result_buffer = Gtk3::TextBuffer‐>new (undef);
  my $result_view = Gtk3::TextView‐>new_with_buffer ($result_buf‐
fer);
  $result_view‐>set (editable => FALSE, margin => 2);

  $self‐>{result_buffer} = $result_buffer;
  $self‐>{result_view} = $result_view; }

sub update_gir_view {
  my ($self) = @_;

  $self‐>{suppress_gir_view_selection_changes} = TRUE;

  $self‐>{gir_model}‐>clear;
  $self‐>{search_entry}‐>set_text (’’);

  my $inserter = sub {
    my ($iter, $text, $path, $is_cat, $is_vis) = @_;
    $self‐>{gir_model}‐>set ($iter,
                             GIR_VIEW_COL_TEXT, $text,
                             GIR_VIEW_COL_PATH, $path,
                             GIR_VIEW_COL_IS_CATEGORY, $is_cat,
                             GIR_VIEW_COL_IS_VISIBLE, $is_vis);
  };

  my $results = $self‐>{parser}‐>enumerate_namespace (TRUE);
  foreach my $result (@$results) {
    my $heading = $result‐>[0];
    my $entries = $result‐>[1];

    my $heading_iter = $self‐>{gir_model}‐>append;
    $inserter‐>($heading_iter, $heading, undef, TRUE, TRUE);

    next unless defined $entries;
    foreach my $entry (@$entries) {
      my $iter = $self‐>{gir_model}‐>append ($heading_iter);
      $inserter‐>($iter,  $entry‐>{name},  $entry‐>{path}, FALSE,
TRUE);

      next unless defined $entry‐>{sub_results};
      foreach my $sub_result (@{$entry‐>{sub_results}}) {
        my $sub_heading = $sub_result‐>[0];
        my $sub_entries = $sub_result‐>[1];

        my   $sub_heading_iter    =    $self‐>{gir_model}‐>append
($iter);
        $inserter‐>($sub_heading_iter, $sub_heading, undef, TRUE,
TRUE);

        next unless defined $sub_entries;
        foreach my $sub_entry (@$sub_entries) {
          my $sub_iter =  $self‐>{gir_model}‐>append  ($sub_head‐
ing_iter);
          $inserter‐>($sub_iter,   $sub_entry‐>{name},   $sub_en‐
try‐>{path}, FALSE, TRUE);
        }
      }
    }
  }

  $self‐>{suppress_gir_view_selection_changes} = FALSE;

  $self‐>display_results ($self‐>{parser}‐>format_namespace); }

sub update_results_from_selection {
  my ($self) = @_;
  my $selection = $self‐>{gir_view}‐>get_selection;
  my ($model, $iter) = $selection‐>get_selected;
  if (!defined $iter) {
    $self‐>display_results ($self‐>{parser}‐>format_namespace);
  } elsif (!$model‐>get ($iter, GIR_VIEW_COL_IS_CATEGORY)) {
    my $path = $model‐>get ($iter, GIR_VIEW_COL_PATH);
    my $name = $self‐>{parser}‐>format_node_name_by_path ($path);
    $self‐>{path_bar}‐>append ($name, $path); # indirectly  calls
update_results
  } }

sub update_results {
  my ($self, $path) = @_;
  $self‐>display_results    ($self‐>{parser}‐>format_node_by_path
($path));

  # If display and selection are out‐of‐sync,  clear  the  selec‐
tion.
  my $selection = $self‐>{gir_view}‐>get_selection;
  my ($model, $iter) = $selection‐>get_selected;
  if (defined $iter) {
    my $sel_path = $model‐>get ($iter, GIR_VIEW_COL_PATH);
    if ($sel_path ne $path) {
      $self‐>{suppress_gir_view_selection_changes} = TRUE;
      {
        $selection‐>unselect_all;
      }
      $self‐>{suppress_gir_view_selection_changes} = FALSE;
    }
  } }

sub quit {
  my ($self) = @_;
  Gtk3::main_quit (); }

package PathBar;

# The BEGIN { eval } dance is to support not loading Gtk3 in text
mode.  BEGIN { eval ’use Glib::Object::Subclass qw/Gtk3::Box/;’ }

sub TRUE () {1} sub FALSE () {0}

sub INIT_INSTANCE {
  my ($self) = @_;

  my $back_button = Gtk3::Button‐>new;
  $back_button‐>set_image (
    Gtk3::Image‐>new_from_icon_name      (’go‐previous‐symbolic’,
’button’));
  $back_button‐>set_sensitive (FALSE);
  $back_button‐>signal_connect (clicked => sub { $self‐>{path_la‐
bel}‐>go_back });

  my $forward_button = Gtk3::Button‐>new;
  $forward_button‐>set_image (
    Gtk3::Image‐>new_from_icon_name  (’go‐next‐symbolic’,   ’but‐
ton’));
  $forward_button‐>set_sensitive (FALSE);
  $forward_button‐>signal_connect     (clicked     =>    sub    {
$self‐>{path_label}‐>go_forward });

  my $nav_box = Gtk3::Box‐>new (’horizontal’, 2);
  $nav_box‐>pack_start ($back_button, FALSE, FALSE, 0);
  $nav_box‐>pack_start ($forward_button, FALSE, FALSE, 0);
  $nav_box‐>get_style_context‐>add_class (’linked’);

  my $path_label = PathLabel‐>new;
  $path_label‐>set_update_func (sub {
    my ($name, $path) = @_;
    $self‐>update_buttons;
    if (defined $self‐>{update_func}) {
      $self‐>{update_func}‐>($name, $path);
    }
  });

  $self‐>pack_start ($nav_box, FALSE, FALSE, 0);
  $self‐>pack_start (Gtk3::VSeparator‐>new, FALSE, FALSE, 0);
  $self‐>pack_start ($path_label, TRUE, TRUE, 0);
  $self‐>set (margin => 2);

  $self‐>{back_button} = $back_button;
  $self‐>{forward_button} = $forward_button;
  $self‐>{path_label} = $path_label;

  return $self; }

sub append {
  my ($self, $name, $path) = @_;
  $self‐>{path_label}‐>append ($name, $path); }

sub set_update_func {
  my ($self, $func) = @_;
  $self‐>{update_func} = $func; }

sub update_buttons {
  my ($self) = @_;
  $self‐>{back_button}‐>set_sensitive           ($self‐>{path_la‐
bel}‐>can_go_back);
  $self‐>{forward_button}‐>set_sensitive        ($self‐>{path_la‐
bel}‐>can_go_forward); }

package PathLabel;

# The BEGIN { eval } dance is to support not loading Gtk3 in text
mode.  BEGIN { eval ’use Glib::Object::Subclass qw/Gtk3::Label/;’
}

sub TRUE () {1} sub FALSE () {0}

sub INIT_INSTANCE {
  my ($self) = @_;

  $self‐>signal_connect (activate_link => sub {
    my (undef, $index) = @_;
    $self‐>{current_child} = $index;
    $self‐>update;
    return TRUE; # handled
  });
  $self‐>set_track_visited_links (FALSE);

  $self‐>{children} = [];
  $self‐>{current_child} = undef;
  $self‐>{natural_width} = 0; }

sub append {
  my ($self, $name, $path) = @_;
  if (defined $self‐>{current_child} &&
      $self‐>{current_child} < $#{$self‐>{children}}) {
    splice @{$self‐>{children}}, $self‐>{current_child}+1;
  }
  push @{$self‐>{children}}, {name => $name, path => $path};
  $self‐>{current_child} = $#{$self‐>{children}};
  $self‐>update; }

sub can_go_back {
  my ($self) = @_;
  return $self‐>{current_child} > 0; }

sub can_go_forward {
  my ($self) = @_;
  return $self‐>{current_child} < $#{$self‐>{children}}; }

sub go_back {
  my ($self) = @_;
  return unless $self‐>{current_child} > 0;
  $self‐>{current_child}‐‐;
  $self‐>update; }

sub go_forward {
  my ($self) = @_;
  return unless $self‐>{current_child} < $#{$self‐>{children}};
  $self‐>{current_child}++;
  $self‐>update; }

sub set_update_func {
  my ($self, $func) = @_;
  $self‐>{update_func} = $func; }

sub update {
  my ($self) = @_;
  $self‐>set_markup ($self‐>_format_children);
  if (defined $self‐>{update_func}) {
    my $child = $self‐>{children}‐>[$self‐>{current_child}];
    $self‐>{update_func}‐>($child‐>{name}, $child‐>{path});
  } }

sub GET_PREFERRED_WIDTH {
  #say ’GET_PREFERRED_WIDTH’;
  my ($self) = @_;
  (undef,   $self‐>{natural_width})   =    $self‐>SUPER::GET_PRE‐
FERRED_WIDTH;
  return (0, 0); }

sub SIZE_ALLOCATE {
  #say ’SIZE_ALLOCATE’;
  my ($self, $allocation) = @_;
  #print  "$_ => $allocation‐>{$_}, " for sort keys %$allocation;
print "0;
  if ($self‐>{natural_width} > $allocation‐>{width}) {
    my @selected = ($self‐>{current_child});
    while (1) {
      my @candidates = @selected;
      if ($selected[0] > 0) {
        unshift @candidates, $selected[0]‐1;
      }
      if ($selected[‐1] < $#{$self‐>{children}}) {
        push @candidates, $selected[‐1]+1;
      }
      $self‐>set_markup ($self‐>_format_children (@candidates));
      my ($ink_rect, $logical_rect) =  $self‐>get_layout‐>get_ex‐
tents;
      my $text_width = $logical_rect‐>{width}/Pango::SCALE ();
      if ($text_width > $allocation‐>{width}) {
        last;
      } else {
        @selected = @candidates;
      }
    }
    $self‐>set_markup ($self‐>_format_children (@selected));
  }
  $self‐>SUPER::SIZE_ALLOCATE ($allocation); }

 #  Use  undef  as  an  indicator  for  left‐out  children.   sub
_add_omission_markers {
  my ($self, @indices) = @_;
  if ($indices[0] > 0) {
    unshift @indices, undef;
  }
  if ($indices[‐1] < $#{$self‐>{children}}) {
    push @indices, undef;
  }
  return @indices; }

sub _format_child {
  my ($self, $index) = @_;
  return ’…’ unless defined $index;
  my $name = $self‐>{children}‐>[$index]‐>{name};
  my $markup = $index == $self‐>{current_child}
    ? "<b>$name</b>"
    : "<a href=’$index’>$name</a>";
  return $markup; }

sub _format_children {
  my ($self, @indices) = @_;
  if (!@indices) {
    @indices = 0..$#{$self‐>{children}};
  }
  @indices = $self‐>_add_omission_markers (@indices);
  return join ’ ▸ ’, map { $self‐>_format_child ($_) }  @indices;
}

