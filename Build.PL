
use strict;
use warnings;

use Module::Build 0.3601;
use lib qw{inc}; use Alien::MSYS::ModuleBuild;

my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Tools required for automake scripts in Windows",
  "dist_author" => [
    "Graham Ollis <plicease\@cpan.org>"
  ],
  "dist_name" => "Alien-MSYS",
  "dist_version" => "0.04",
  "license" => "perl",
  "module_name" => "Alien::MSYS",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Archive::Zip" => 0,
    "File::ShareDir" => 0,
    "HTTP::Tiny" => 0,
    "perl" => "5.008"
  },
  "script_files" => [],
  "share_dir" => {
    "dist" => "share"
  },
  "test_requires" => {
    "FindBin" => 0,
    "Test::More" => 0
  }
);


my %fallback_build_requires = (
  "FindBin" => 0,
  "Module::Build" => "0.3601",
  "Test::More" => 0
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  delete $module_build_args{test_requires};
  $module_build_args{build_requires} = \%fallback_build_requires;
}

my $build = Alien::MSYS::ModuleBuild->new(%module_build_args);

$build->create_build_script;
