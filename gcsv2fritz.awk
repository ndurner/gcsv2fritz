{
	if (FNR == 1) {
		print "<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>";
		print "<phonebooks>";
		print "	<phonebook>";
	}

	if (match($0, ",Given Name Yomi,") || (!match($31, "[0-9]") && !match($33, "[0-9]") && !match($35, "[0-9]")))
		next;

	print "		<contact>";
	print "			<person>";
	print "				<realName>" $1 "</realName>";
	print "			</person>";
	print "			<telephony>";
	if ($30 == "Home")
		print "				<number prio=\"1\" type=\"home\">" $31 "</number>";
	if ($30 == "Mobile")
		print "				<number prio=\"2\" type=\"mobile\">" $31 "</number>";
	if ($30 == "Work" || $30 == "Mobil Geschäftlich" || $30 == "Work Mobile")
		print "				<number prio=\"3\" type=\"work\">" $31 "</number>";

	if ($32 == "Home")
		print "				<number prio=\"1\" type=\"home\">" $33 "</number>";
	if ($32 == "Mobile")
		print "				<number prio=\"2\" type=\"mobile\">" $33 "</number>";
	if ($32 == "Work" || $32 == "Mobil Geschäftlich" || $32 == "Work Mobile")
		print "				<number prio=\"3\" type=\"work\">" $33 "</number>";

	if ($34 == "Home")
		print "				<number prio=\"1\" type=\"home\">" $35 "</number>";
	if ($34 == "Mobile")
		print "				<number prio=\"2\" type=\"mobile\">" $35 "</number>";
	if ($34 == "Work" || $34 == "Mobil Geschäftlich" || $34 == "Work Mobile")
		print "				<number prio=\"3\" type=\"work\">" $35 "</number>";

	print "			</telephony>";
	print "			<uniqueid>" FNR "</uniqueid>";
	print "		</contact>";
}

