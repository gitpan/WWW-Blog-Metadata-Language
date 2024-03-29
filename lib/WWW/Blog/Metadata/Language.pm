package WWW::Blog::Metadata::Language;

use warnings;
use strict;
use Carp;

our $VERSION = '0.01';

use WWW::Blog::Metadata;
use Text::Language::Guess;

# Module implementation here

WWW::Blog::Metadata->mk_accessors(qw( language ));


sub on_got_html {
	my ($class, $meta, $html, $base_uri) = @_;
	my $guesser = Text::Language::Guess->new();
	my $plain_text = ${$html};
	$plain_text =~ s/<.*>?//g;
	my $language = $guesser->language_guess_string($plain_text);
	$meta->language($language);
}
sub on_got_html_order { 99 }


1; # Magic true value required at end of module
__END__

=head1 NAME

WWW::Blog::Metadata::Language - A plugin for WWW::Blog::Metadata that extracts or guesses the language of a blog.


=head1 VERSION

This document describes WWW::Blog::Metadata::Language version 0.01


=head1 SYNOPSIS

    use WWW::Blog::Metadata;
    
    my $meta = WWW::Blog::Metadata->extract_from_uri($uri)
        or die WWW::Blog::Metadata->errstr;
        
    ## or

    my $meta = WWW::Blog::Metadata->extract_from_html(\$html, $base_uri)
        or die WWW::Blog::Metadata->errstr;

    my $language = $meta->language();
    
  
=head1 DESCRIPTION

WWW::Blog::Metadata::Language is a plugin for WWW::Blog::Metadata that guesses the language of a blog by passing the plain text of the blog to the Text::Language::Guess module. Thanks to the typically rich textual content on blogs, this should work quite reliably.


=head1 INTERFACE 

=for author to fill in:
    Write a separate section listing the public components of the modules
    interface. These normally consist of either subroutines that may be
    exported, or methods that may be called on objects belonging to the
    classes provided by the module.

=over

=item * language
	
	my $language = $meta->language();
	
Returns the keyword of the guessed language as specified in Text::Language::Guess.

=back	


=head1 SEE ALSO

=over

=item * L<WWW::Blog::Metadata>

=item * L<Text::Language::Guess>

=back


=head1 DIAGNOSTICS

=for author to fill in:
    List every single error and warning message that the module can
    generate (even the ones that will "never happen"), with a full
    explanation of each problem, one or more likely causes, and any
    suggested remedies.


=head1 CONFIGURATION AND ENVIRONMENT

=for author to fill in:
    A full explanation of any configuration system(s) used by the
    module, including the names and locations of any configuration
    files, and the meaning of any environment variables or properties
    that can be set. These descriptions must also include details of any
    configuration language used.
  
WWW::Blog::Metadata::Language requires no configuration files or environment variables.


=head1 DEPENDENCIES

=for author to fill in:
    A list of all the other modules that this module relies upon,
    including any restrictions on versions, and an indication whether
    the module is part of the standard Perl distribution, part of the
    module's distribution, or must be installed separately. ]

WWW:Blog::Metadata;
Text::Language::Guess;


=head1 INCOMPATIBILITIES

=for author to fill in:
    A list of any modules that this module cannot be used in conjunction
    with. This may be due to name conflicts in the interface, or
    competition for system or program resources, or due to internal
    limitations of Perl (for example, many modules that use source code
    filters are mutually incompatible).

None reported.


=head1 BUGS AND LIMITATIONS

=for author to fill in:
    A list of known problems with the module, together with some
    indication Whether they are likely to be fixed in an upcoming
    release. Also a list of restrictions on the features the module
    does provide: data types that cannot be handled, performance issues
    and the circumstances in which they may arise, practical
    limitations on the size of data sets, special cases that are not
    (yet) handled, etc.

No bugs have been reported.

Please report any bugs or feature requests to
C<bug-www-blog-metadata-language@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.


=head1 AUTHOR

Darko Obradovic  C<< <dobradovic@gmx.de> >>


=head1 LICENCE AND COPYRIGHT

Copyright (c) 2008, Darko Obradovic C<< <dobradovic@gmx.de> >>. All rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.


=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.
