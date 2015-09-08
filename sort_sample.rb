

@factor = ["Smile","Female","Young","Many"]

#適当なデータを用意
img = [{'Smile' => 90,
		'Female' => 20,
		'Young' => 10},
{'Smile' => 30,
		'Female' => 50,
		'Young' => 90},
{'Smile' => 30,
		'Female' => 50,
		'Young' => 100},
{'Smile' => 20,
		'Female' => 40,
		'Young' => 70},
{'Smile' => 30,
		'Female' => 70,
		'Young' => 10},
{'Smile' => 90,
		'Female' => 80,
		'Young' => 40, 'Many'=>20}]

total_scores = {}
scores = {}
innnerscores = {}
totalarray = []

#画像の数だけ、totalを出す配列要素を準備
img.each{|x|
	totalarray.push(0)
}

@factor.map.with_index { |factor,j| #smileとかの要素分回す
	img.each_with_index{|x,i| #imgの数だけ回す
		innnerscores[i] = x[factor].to_i
		totalarray[i] += x[factor].to_i#totalのためにxが同じでfactorが違うものを全部足したい
	}
	scores[factor] = innnerscores #smile_scoreとかにあたるHashをscorehashに内包
	p '['+factor+']'
	p scores[factor].sort {|(k1, v1), (k2, v2)| v2 <=> v1 }
}

img.each_with_index{|x,i|#imgの数だけtotalをHashに入れて集計
	total_scores[i] = totalarray[i]
}
p '[Total]'
p total_scores.sort {|(k1, v1), (k2, v2)| v2 <=> v1 }

# 先頭のHashのKeyの番号がわかればそのKey番目の配列要素のimgHashの画像をセット





