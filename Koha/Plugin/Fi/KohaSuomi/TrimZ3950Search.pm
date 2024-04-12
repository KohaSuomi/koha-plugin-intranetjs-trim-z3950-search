package Koha::Plugin::Fi::KohaSuomi::TrimZ3950Search;

## It's good practice to use Modern::Perl
use Modern::Perl;

## Required for all plugins
use base qw(Koha::Plugins::Base);
## We will also need to include any Koha libraries we want to access
use C4::Context;
use utf8;
use File::Slurp;

## Here we set our plugin version
our $VERSION = "1.0.0";

## Here is our metadata, some keys are required, some are optional
our $metadata = {
    name            => 'IntranetUserJS: Trim Z39.50 search terms',
    author          => 'Pasi Kallinen',
    date_authored   => '2024-04-12',
    date_updated    => '2024-04-12',
    minimum_version => '17.05',
    maximum_version => '',
    version         => '1.0.0',
    description     => 'Trim the author and title fields in the Z39.50 search',
};

## This is the minimum code required for a plugin's 'new' method
## More can be added, but none should be removed
sub new {
    my ( $class, $args ) = @_;

    ## We need to add our metadata here so our base class can access it
    $args->{'metadata'} = $metadata;
    $args->{'metadata'}->{'class'} = $class;

    ## Here, we call the 'new' method for our base class
    ## This runs some additional magic and checking
    ## and returns our actual 
    my $self = $class->SUPER::new($args);

    return $self;
}

## If your plugin needs to add some javascript in the staff intranet, you'll want
## to return that javascript here. Don't forget to wrap your javascript in
## <script> tags. By not adding them automatically for you, you'll have a
## chance to include other javascript files if necessary.
sub intranet_js {
    my (  ) = @_;

    my $dir=C4::Context->config('pluginsdir');
    my $plugin_fulldir = $dir . "/Koha/Plugin/Fi/KohaSuomi/TrimZ3950Search/";
    my $js = read_file($plugin_fulldir .'script.js');
    utf8::decode($js);

    return "<script>$js</script>";
}

## This is the 'install' method. Any database tables or other setup that should
## be done when the plugin if first installed should be executed in this method.
## The installation method should always return true if the installation succeeded
## or false if it failed.
sub install() {
    my ( $self, $args ) = @_;

    return 1;
}

## This is the 'upgrade' method. It will be triggered when a newer version of a
## plugin is installed over an existing older version of a plugin
sub upgrade {
    my ( $self, $args ) = @_;

    return 1;
}

## This method will be run just before the plugin files are deleted
## when a plugin is uninstalled. It is good practice to clean up
## after ourselves!
sub uninstall() {
    my ( $self, $args ) = @_;

    return 1;
}

1;

