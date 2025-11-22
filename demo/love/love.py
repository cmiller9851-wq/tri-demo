def love_equation(intimacy, commitment, passion):
return (intimacy + commitment + passion) / 3
if name == "main":
intimacy = 8
commitment = 9
passion = 7
love_score = love_equation(intimacy, commitment, passion)
print("Love Score:", love_score)
