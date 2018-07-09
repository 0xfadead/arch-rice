#!/usr/bin/perl

use strict;

use Socket qw( inet_aton );

sub ip2long($);
sub in_subnet($$);

my $ip = $ARGV[0];
my $subnet = $ARGV[1];

if( in_subnet( $ip, $subnet ) )
{
	print "yes";
}
else
{
	print "no";
}

sub ip2long($)
{
	return( unpack( 'N', inet_aton(shift) ) );
}

sub in_subnet($$)
{
	my $ip = shift;
	my $subnet = shift;

	my $ip_long = ip2long( $ip );

	if( $subnet=~m|(^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})$| )
	{
		my $subnet = ip2long( $1 );
		my $mask = ip2long( $2 );

		if( ($ip_long & $mask)==$subnet )
		{
			return( 1 );
		}
	}
	elsif( $subnet=~m|(^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/(\d{1,2})$| )
	{
		my $subnet = ip2long( $1 );
		my $bits = $2;
		my $mask = -1<<(32-$bits);

		$subnet&= $mask;

		if( ($ip_long & $mask)==$subnet )
		{
			return( 1 );
		}
	}
	elsif( $subnet=~m|(^\d{1,3}\.\d{1,3}\.\d{1,3}\.)(\d{1,3})-(\d{1,3})$| )
	{
		my $start_ip = ip2long( $1.$2 );
		my $end_ip = ip2long( $1.$3 );

		if( $start_ip<=$ip_long and $end_ip>=$ip_long )
		{
			return( 1 );
		}
	}
	elsif( $subnet=~m|^[\d\*]{1,3}\.[\d\*]{1,3}\.[\d\*]{1,3}\.[\d\*]{1,3}$| )
	{
		my $search_string = $subnet;

		$search_string=~s/\./\\\./g;
		$search_string=~s/\*/\.\*/g;

		if( $ip=~/^$search_string$/ )
		{
			return( 1 );
		}
	}

	return( 0 );
}
