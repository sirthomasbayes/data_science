# Calculate probability of getting blackjack and winning  
# the game given the what the dealer shows 
# (we exclude ties in our calculation, as ties are usually
#  resolved as a player loss or a push). 

function blackjack(dealer=0)
{
	if (dealer == 0)
		print ((3/13) * (4/51));
	else
	{
		if (dealer < 11 && dealer > 1)				# dealer only shows a non-face card (aces included in set of face cards)
			print ((12/51) * (4/50));
		else if (dealer == 1)						# dealer shows an ace, and doesn't have blackjack
			print ((12/51) * (3/50) * (37/49));  
		else 										# dealer shows a non-ace face card, and doesn't have blackjack
			print ((11/51) * (3/50) * (45/49)); 
	}
}
