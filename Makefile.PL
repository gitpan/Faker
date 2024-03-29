
# This file was automatically generated by Dist::Zilla::Plugin::MakeMaker v5.013.
use strict;
use warnings;

use 5.010000;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Extensible Fake Data Generator",
  "AUTHOR" => "Al Newkirk <anewkirk\@ana.io>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Faker",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Faker",
  "PREREQ_PM" => {
    "Bubblegum" => "0.25",
    "Bubblegum::Functions" => "0.04",
    "DateTime" => 0,
    "DateTime::TimeZone" => 0
  },
  "TEST_REQUIRES" => {},
  "VERSION" => "0.09",
  "test" => {
    "TESTS" => "t/*.t t/faker/*.t t/faker/generator/*.t"
  }
);


my %FallbackPrereqs = (
  "Bubblegum" => "0.25",
  "Bubblegum::Functions" => "0.04",
  "DateTime" => 0,
  "DateTime::TimeZone" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



