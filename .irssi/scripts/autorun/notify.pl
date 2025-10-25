use strict;
use warnings;
use Irssi;

sub sig_message_public {
    my ($server, $msg, $nick, $address, $target) = @_;

    $msg =~ s/'/'\\''/g;
    $msg =~ s/"/"/g;

    my $notification_msg = "[$target] $nick: $msg";

    system("bash -c notify=\$(notify-send -u low -i notification-message-im -A 'open=Open IRC' \'$notification_msg\') &");
}

sub sig_message_private {
    my ($server, $msg, $nick, $address) = @_;

    $msg =~ s/'/'\\''/g;
    $msg =~ s/"/"/g;

    system("bash -c notify=\$(notify-send -u low -i notification-message-im -A 'open=Open IRC' \'$nick\' \'$msg\')  &");
}

Irssi::signal_add('message public', 'sig_message_public');
Irssi::signal_add('message private', 'sig_message_private');
