#!/usr/bin/perl
my @metadata;
my $player_arg = "";

# try cmus first
my @cmus = split /^/, exec 'cmus-remote -Q';

foreach my $line (@cmus) {
    my @data = split /\s/, $line;
    if (shift @data eq 'tag') {
        my $key = shift @data;
        my $value = join ' ', @data;

        @metadata[0] = $value if $key eq 'artist';
        @metadata[1] = $value if $key eq 'title';
    }
}

if (@metadata) {
    # metadata found so we are done
    print(join ' - ', @metadata);
    exit 0;
}
