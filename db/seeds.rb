# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Dictionary.create(main_word: 'neighbour', pronounce: '|neɪbə(r)', type:'명사', meaning: '이웃 (사람)', example: "We've had a lot of support from all our friends and neighbours.")
Dictionary.create(main_word: 'neigh', pronounce: 'neɪ', type:'부사', meaning: '(구식) 그게 아니라(방금 한 말보다 더 강한 어구를 도입할 때 씀)', example: "Such a policy is difficult, nay impossible.")
Dictionary.create(main_word: 'neigh', pronounce: 'neɪ', type:'동사', meaning: '(말이 히이잉 하고) 울다')
Dictionary.create(main_word: '네이버', meaning: '(IT) naver')
Dictionary.create(main_word: 'NAVER', meaning: '뉴스 ,우리가 필요한 정보를 볼 수있는 웹 사이트')