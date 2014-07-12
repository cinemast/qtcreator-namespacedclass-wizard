#!/usr/bin/perl

use strict;
use warnings;
use Getopt::Long;
use IO::File;
use File::Path qw(make_path remove_tree);
use POSIX qw(strftime);

my $optDryRun = 0;
my $optHelp = 0;
my $optClassName = 'MyClass';
my $optCppHeaderSuffix = 'h';
my $optCppSourceSuffix = 'cpp';
my $optDescription = '';
my $optIndentation = 4;
my $optAuthorMail = '';
my $optAuthorName = '';
my $optLowerCase = 1;

my $USAGE=<<EOF;
Usage: createclass.pl [--help] | [--dry-run] [--lowercase]
                   [--class-name=<some.package.classname>]
                   [--header-suffix=<header suffix>]
                   [--source-suffix=<source suffix>]
                   [--auther-name=<Name>]
                   [--author-email=<name\@domain.tld>]
                   [--indentation=<4>]

Package based clase generator script.

EOF

my $argCount = scalar(@ARGV);
if ($argCount == 0
    || !GetOptions("help" => \$optHelp,
                   "dry-run" => \$optDryRun,
                   "lowercase" => \$optLowerCase,
                   "class-name:s" => \$optClassName,
                   "header-suffix:s" => \$optCppHeaderSuffix,
                   "source-suffix:s" => \$optCppSourceSuffix,
                   "author-name:s" => \$optAuthorName,
                   "author-mail:s" => \$optAuthorMail,
                   "indentation:i" => \$optIndentation)
    || $optHelp != 0) {
    print $USAGE;
    exit (1);
}


my @packages = split('\.', $optClassName);
my $length = scalar(@packages);
my $classname = $packages[$length-1];
@packages = splice(@packages,0,$length-1);
my $path = join("/",@packages);

my $baseFileName = $classname;

if ($optLowerCase) {
    my $baseFileName = lc($baseFileName);
}

my $sourceFileName = $path . "/" . $baseFileName . '.' . $optCppSourceSuffix;
my $headerFileName = $path . "/" . $baseFileName . '.' . $optCppHeaderSuffix;

my $guard = uc(join("_",@packages))."_".uc($classname)."_H__";
my $created = strftime("%F", localtime);

if ($optDryRun) {
#   -- Step 1) Dry run: Print file names along with attributes
   print $sourceFileName,",openeditor\n";
   print $headerFileName,",openeditor\n";
} else {
#    make_path($path)
    
    my $license = <<"END";
/*
 * $baseFileName.$optCppHeaderSuffix
 ****************************************************************************
 * Created on: $created
 * Author: $optAuthorName <$optAuthorMail>
 *
 * This source code and its use and distribution, is subject to the terms
 * and conditions of the applicable license agreement.
 *****************************************************************************/

#ifndef $guard
#define $guard


END

print $license;

for (my $i =0; $i < scalar(@packages); $i++) {
    print " " x ($optIndentation * $i);
    print "namespace $packages[$i]\n";
    print " " x ($optIndentation * $i);
    print "{\n";
}

print " " x ($optIndentation * scalar(@packages));
print "class $classname\n";
print " " x ($optIndentation * scalar(@packages));
print "{\n\n\n";
print " " x ($optIndentation * scalar(@packages));
print "};\n";

for (my $i=scalar(@packages)-1; $i >= 0; $i--) {
    print " " x ($optIndentation * $i);
    print "}\n";
}

print "\n#endif // $guard\n";

}
