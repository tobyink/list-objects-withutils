package List::Objects::WithUtils::Hash;
use strictures 1;

require Role::Tiny;
Role::Tiny->apply_roles_to_package( __PACKAGE__,
  'List::Objects::WithUtils::Role::Hash'
);

use Exporter 'import';
our @EXPORT = 'hash';
sub hash { __PACKAGE__->new(@_) }

1;

=pod

=head1 NAME

List::Objects::WithUtils::Hash - Hash-type objects WithUtils

=head1 SYNOPSIS

  use List::Objects::WithUtils 'hash';

  my $hash = hash( foo => 'bar' );

=head1 DESCRIPTION

This class is a concrete implementation of
L<List::Objects::WithUtils::Role::Hash>. Methods are documented there.

=head2 hash

Creates a new hash object.

=head1 AUTHOR

Jon Portnoy <avenj@cobaltirc.org>

Derived from L<Data::Perl> by Matt Phillips (CPAN: MATTP) et al

Licensed under the same terms as Perl

=cut
