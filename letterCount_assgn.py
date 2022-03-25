wordInput = input("Enter an input: ")
wordCount = dict()
# words = wordInput.split()      it is for word counter not letter counter

for i in wordInput:
    if i in wordCount:
        wordCount[i] +=1
    else:
        wordCount[i] = 1

# sortedDic = sorted(wordCount.items(), key=lambda x: x[1], reverse=True)
# print(dict(sortedDic))

print(wordCount)
