# ABSTRACT: Extensible Fake Data Generator
package Faker;

use Bubblegum;
use Faker::Factory;

our $VERSION = '0.06'; # VERSION


sub maker {
    shift && return Faker::Factory->new(@_)->create;
}

1;

__END__

=pod

=head1 NAME

Faker - Extensible Fake Data Generator

=head1 VERSION

version 0.06

=head1 DESCRIPTION

Faker is a Perl library that generates fake data for you. The design is heavily
inspired by the PHP implementation which was heavily based on Perl's Data::Faker.
So I guess you could say that this library is a rewrite of Data::Faker having
observed how other languages have implemented it, e.g. the Python and Ruby
implementations.

Whether you need to bootstrap your database, create good-looking XML documents,
fill-in your persistence to stress test it, or anonymize data taken from a
production service, Faker makes it easy to generate fake data with some
semantics.

=head1 SYNPOSIS

    use Faker;

    my $fake = maker Faker;

    $fake->name;
    # Lucy Cechtelar

    $fake->address;
    # 426 Jordy Lodge
    # Cartwrightshire, SC 88120-6700

    $fake->paragraph;
    # Rerum atque repellat voluptatem quia rerum. Numquam excepturi beatae sint
    # laudantium consequatur. Magni occaecati itaque sint et sit tempore. Nescit
    # amet quidem. Iusto deleniti cum autem ad quia aperiam.

    for (0..10) {
        say $fake->name;
    }
    # Adaline Reichel
    # Dr. Santa Prosacco DVM
    # Noemy Vandervort V
    # Lexi O'Conner
    # Gracie Weber
    # Roscoe Johns
    # Emmett Lebsack
    # Keegan Thiel
    # Wellington Koelpin II
    # Ms. Karley Kiehn V

=head1 FORMATTERS

Use L<Faker::Factory> to create and initialize a faker generator, which can
generate data by executing methods named after the type of data you want.

    use Faker::Factory;
    my $fake = Faker::Factory->new(locale => 'en_US')->create;

    $fake->ip_address_v4;
    # 136.98.126.140

Even in this example the method call is actually being proxied to a provider
class which returns a random result with each call. Each of the generator
properties (like name, address, and paragraph) are called "formatters". A faker
generator has many of them, packaged in "providers". Here is a list of the
bundled formatters in the default locale.

=head2 Faker::Provider::en_US::Address

    city_prefix                          East
    secondary_address                    Suite 666
    state_name                           Utah
    state_abbr                           SD
    city_suffix                          bury
    street_suffix                        Avenue
    building_number                      32
    city                                 Lake Christopville
    street_name                          Norene Circle
    street_address                       28 Maritza Avenue Apt. 436
    postal_code                          84049
    address                              2556 Wuckert Street, Dale, PR 48375-4904
    country_name                         Russian Federation
    latitude                             -51.511412
    longitude                            -72.341657

=head2 Faker::Provider::en_US::Color

    color_name                           DeepPink
    hex_color                            #bbab85
    rgbcolors                            50,251,69
    rgbcolors_css                        rgb(220,14,160)
    safe_color_name                      blue
    safe_hex_color                       #ff00b6

=head2 Faker::Provider::en_US::Company

    buzzword_type1                       implement
    buzzword_type2                       viral
    buzzword_type3                       supply-chains
    catch_phase                          paradigms user-centric evolve
    company                              Lockman, Feeney and Collier
    company_suffix                       Inc.
    jargon_buzz_word                     synergy
    jargon_edge_word                     Enterprise-wide

=head2 Faker::Provider::en_US::DateTime

    century                              XIX
    date                                 1992-10-04T23:10:36
    date_now                             2014-01-27T11:04:26
    date_this_century                    1998-06-05T11:04:26
    date_this_decade                     2012-08-12T11:04:26
    date_this_year                       2013-08-26T11:04:26
    time_unix                            1346319297
    timezone                             Europe/Moscow

=head2 Faker::Provider::en_US::File

    mime_type                            xar
    file_extension                       video/x-m4v

=head2 Faker::Provider::en_US::Internet

    company_email_address                Abshire.Nya@dooley.org
    domain_name                          aufderhar-mcdermott.info
    domain_word                          lindgren-lynch
    email_address                        Emely52@schuppe-crist.biz
    email_domain                         gmail.com
    ip_address                           178.127.173.141
    ip_address_v4                        73.244.92.148
    ip_address_v6                        0482:6a30:7453:3940:967f:5448:65e8:23ef
    safe_email_domain                    example.org
    safe_email_address                   oLuettgen@ruecker.net
    top_level_domain                     net
    url                                  http://stoltenberg-volkman.net/
    username                             Melisa.Lynch

=head2 Faker::Provider::en_US::Lorem

    paragraph                            quas libero esse eaque. aut qui ...
    paragraphs                           ad laboriosam magnam. architecto ...
    sentence                             nisi animi est harum sit.
    sentences                            sit sapiente non ipsam. praesentium ...
    word                                 fewq
    words                                esrar laborum aliquid atque sunt

=head2 Faker::Provider::en_US::Miscellaneous

    boolean                              1
    country_code                         PT
    language_code                        it
    locale                               aa_DJ
    md5                                  39dc0ea879e740d0268bc6a005d7cc19
    sha1                                 f5e9fd4b31b9693c475db245ed2e1cc382a...
    sha256                               2a9cac8e68aa2355cef421609e3db51a946...

=head2 Faker::Provider::en_US::Person

    prefix                               'Ms.'
    suffix                               'Jr.'
    name                                 'Dr. Zane Stroman'
    first_name                           'Maynard'
    last_name                            'Zulauf'

=head2 Faker::Provider::en_US::PhoneNumber

    phone_number                         1-199-961-5441x982

=head2 Faker::Provider::en_US::UserAgent

    chrome_user_agent                    Mozilla/5.0 (Windows; U; Windows NT ...
    firefox_user_agent                   Mozilla/5.0 (X11; U; Linux x86_64; ...
    internet_explorer_user_agent         Mozilla/4.0 (compatible; MSIE 5.01; ...
    opera_user_agent                     Opera/6.01 (Windows 2000; U) [de] ...
    safari_user_agent                    Mozilla/5.0 (Macintosh; U; PPC Mac ...

=head1 ACKNOWLEDGEMENTS

Some parts of this library were adopted from the following implementations.

=over 4

=item *

PHP Faker L<https://github.com/fzaninotto/Faker>

=item *

Python Faker L<https://github.com/joke2k/faker>

=item *

Ruby Faker L<https://github.com/stympy/faker>

=back

=head1 AUTHOR

Al Newkirk <anewkirk@ana.io>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Al Newkirk.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
