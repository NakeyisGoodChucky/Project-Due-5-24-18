include \masm32\include\masm32rt.inc

.data
	BUFFER_SIZE	= 10
	str1	db		"You enter a small cave, inside is a goblin.", 10, 13, "Are you a dumb jerk and ATTACK it or a coward and FLEE from it.", 0ah, 0dh, 0
	str2	db		10, "Oh come on, hypothetical you has never even been in a fight", 10, 13, "YOU LOSE!", 0ah, 0dh, 0
	str3	db		10, "Ha! Look at the little baby run. The goblins like three feet tall! SHAME!", 0ah, 0dh, 0
	str4	db		"Choose your fate", 0ah, 10, 0dh, "Attack", 10, 13, "Flee", 10, 10, 13, 0
	str5	db		10, "Brilliant! The only way to win is not to play the Game! That or typosbut still You Win!", 10, 13, 0
	Attack	db		"Attack", 0
	Flee	db		"Flee", 0
	attack	db		"attack", 0
	flee	db		"flee", 0

.data?
	Answer	Byte BUFFER_SIZE DUP(0)

.code

start PROC

Invoke StdOut, addr str1
Invoke StdOut, addr str4
Invoke StdIn,  addr	Answer, BUFFER_SIZE

Invoke lstrcmp, addr Answer, addr Attack

.if		(eax == 0)
		Invoke	StdOut, addr str2
		inkey
		Invoke ExitProcess, 0
.elseif (eax != 0)
		Invoke	lstrcmp, addr Answer, addr attack
			.if	(eax == 0)
				Invoke StdOut, addr str2
				inkey
				Invoke ExitProcess, 0
		.elseif (eax != 0)
				Invoke lstrcmp, addr Answer, addr attack
					.if (eax == 0)
						Invoke StdOut, addr str2
						inkey
						Invoke ExitProcess, 0
				.elseif (eax != 0)
						Invoke lstrcmp, addr Answer, addr Flee
							.if (eax == 0)
								Invoke StdOut, addr str3
								inkey
								Invoke ExitProcess, 0
						.elseif (eax != 0)
								Invoke lstrcmp, addr Answer, addr flee
									.if (eax == 0)
										Invoke StdOut, addr str3
										inkey
										Invoke ExitProcess, 0
								.elseif (eax != 0)
										Invoke StdOut, addr str5
										inkey
										Invoke ExitProcess, 0
								.endif
						.endif
				.endif
		.endif
.endif

start ENDP
END start