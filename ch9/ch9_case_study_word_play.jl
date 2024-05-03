### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ a193f7b0-015d-11ef-2cd8-8b90df9391a2
md"""
# Sooyoung Kim's Think Julia 

![image](https://github.com/kimsooyoung/ThinkJulia/assets/12381733/260603e2-20ed-428e-b15b-0381f73fb46c)
"""

# ╔═╡ f6210c3d-518a-45ac-ba39-2be8095394fe
md"""
## Case Study: Word Play (단어로 놀기)

"""

# ╔═╡ 4430884b-558a-41b6-8c21-1ba97b840b57
md"""
## 9.1 단어 목록 읽기
"""

# ╔═╡ 40257df1-7dc4-4461-a9ed-90e99f3b6f05
md"""
4강에 이어서 사례 연구 챕터가 돌아왔습니다. 이번 강의에서는 어떤 성질을 가진 단어를 찾아보는 낱말 퍼즐을 풀어볼 것입니다. 

이번 챕터를 위해 113809개의 단어가 적혀 있는 **words.txt**라는 파일을 준비해두었습니다. 파일을 불러와보겠습니다.
"""

# ╔═╡ f6872e68-c46f-40b6-aa9e-9939ac4ed139
fin = open("words.txt")

# ╔═╡ d4c41e89-6cad-4543-9aac-37f6a774c731
md"""
여기에서 사용한 **open()**이라는 함수는 Julia에 내장된 함수로 매개변수인 파일명을 받아 파일 스트림을 반환합니다. 

**파일 스트림**이란, 우리의 Julia 프로그램과 txt 문자 파일 사이 데이터의 읽고 쓰기를 위한 추상적인 개념입니다. 

말이 좀 어려운데요, 우리가 스마트폰을 사용할 때, 메모장의 글자, 동영상, 혹은 게임의 화면 모두 액정 디스플레이를 통해 눈으로 전달되지요? 이처럼 여러 데이터를 효율적으로 표현하기 위한 방법이라고 이해하시면 되겠습니다.
"""

# ╔═╡ 9d572b74-58b8-434c-8149-ab8a20c30011
md"""
![image](https://github.com/kimsooyoung/mirobot_ros2/assets/12381733/6d51d660-1376-4932-b413-3b49eebcc803)
"""

# ╔═╡ 0e65ed59-5b5e-4b0b-9884-2714b484df4e
readline(fin)

# ╔═╡ e066a8da-6271-4304-aed4-19cd67b07086
md"""
Julia에서는 파일 스트림을 사용하여 파일을 한줄씩 읽거나 한 단어씩 읽는 등의 유용한 내장 함수들을 제공합니다. **readline()** 함수는 파일의 첫 부분부터 한줄씩 읽고 문자열로 반환합니다.
"""

# ╔═╡ 300305e6-a3f1-4d65-a943-57e1499c2ebc
readline(fin)

# ╔═╡ 3dfe54dc-a246-47e9-96b7-40fd7184e77a
md"""
readline을 또 호출하였습니다. 자동으로 다음 라인을 읽은 것이지요. 이는 파일 스트림 내부적으로 현재 위치를 담고 있기 때문입니다.
"""

# ╔═╡ be3369ef-4bab-4cc6-af37-106b7ba7df0c
md"""
아래와 같이 for-loop를 사용하여 특정 개수만큼의 단어를 읽어들일 수도 있겠지요.
"""

# ╔═╡ eeaf2d20-3e29-4632-9c6a-62c1aec38196
for i in 1:10
	cur_word = readline(fin)
	println(cur_word)
end

# ╔═╡ 0e1286b6-03bd-444e-8091-e7bb720bc196
md"""
!!! notes
	이번 챕터는 연습문제가 조금 많습니다. 그래도 코딩 실력을 향상시키기 위한 밑거름이라 생각하고 하나씩 풀어보세요!
"""

# ╔═╡ c6a08061-7192-45e8-9f73-c9f549415aac
md"""
### 연습 9-1
---
> words.txt 파일 내 단어 중에서, 길이가 20글자 이상인 단어만 출력하는 프로그램을 작성해보세요. (모든 단어는 영어로 구성되어 있습니다.)
"""

# ╔═╡ 7b397589-bcbd-4a11-ad23-043ef40f67ec
md"""
### 연습 9-2
---
> 단어 내 알파벳 'e'가 없다면 true를 반환하는 함수 **hasno_e**를 작성해보세요.
"""

# ╔═╡ 79c2710c-1a59-42d7-877a-9e4e96fb2efb
md"""
### 연습 9-3
---
> 어떤 단어와 금지 문자로 구성된 문자열을 받아서, 그 단어가 금지 문자를 포함하지 않으면 true를 반환하는 함수 **avoids**를 작성하세요.

> 프로그램을 좀 더 수정해봅시다. 금지 문자로 구성된 문자열을 입력받고, 금지 문자를 포함하지 않는 단어의 개수도 출력하도록 해보세요. (제외되는 단어의 숫자가 가장 작아지도록 하는 5개의 금지 문자를 찾아보세요!)
"""

# ╔═╡ dd5d884f-be47-4c7a-b8df-ca45a3b6fc5e
md"""
### 연습 9-4
---
> 어떤 단어와 문자열을 입력받은 후, 단어가 문자열에 있는 글자로만 이루어져 있으면 true를 반환하는 함수 **usesonly**를 작성하세요. (acefhlo만 가지고 문장을 만들 수 있나요? 작성한 코드로 확인해봅시다.)
"""

# ╔═╡ 6dcabe0b-6ba2-4526-addc-119ee74f9802
md"""
### 연습 9-5
---
> 어떤 단어와 문자열을 입력받은 후, 단어가 문자열에 있는 모든 글자를 한 번 이상 사용하면 true를 반환하는 함수 **usesall**을 작성하세요. (모음 aeiou만을 사용하는 단어는 몇 개가 있나요?)
"""

# ╔═╡ c5a167f9-9809-41fa-ab3e-5f8919275316
md"""
### 연습 9-6
---
> 단어의 글자들이 알파벳 숫서로 되어 있으면 (같은 글자가 연달아 있는 것도 괜찮습니다). true를 반환하는 **isabecedarian**을 작성하세요. 글자가 알파벳 순서인 단어는 얼마나 많이 있나요?
"""

# ╔═╡ 0217eeef-0b28-468a-9a20-9998b5fcbcdf
md"""
## 9.2 검색
"""

# ╔═╡ d52b15ee-4b27-4856-b292-964e88091e24
md"""
앞선 연습문제들을 풀어보셨다면, 눈치채셨겠지만, 대부분의 문제들은 검색 패턴으로 풀 수 있습니다. 

예를 들어, 단어 안에 문자 e가 포함되어 있는지 판별하는 **hasno_e**는 아래와 같이 구현할 수 있지요.
"""

# ╔═╡ 36d1ca3d-2ad1-452c-943a-8c43092474fd
function hasno_e(word)
    for letter in word
        if letter == 'e'
            return false
        end
    end
    return true
end

# ╔═╡ edc6908d-3c90-4d69-815d-8f92c3687996
begin
	@show hasno_e("cream")
	@show hasno_e("brick")
end

# ╔═╡ fb12668f-33a5-4804-8824-9d17965d8081
md"""
단어가 주어진 문자열에 있는 글자로만 이루어져 있으면 true를 반환하는 함수 **usesonly**도 검색 패턴을 사용하여 ∈(\in) 연산자를 사용하여 구현해본 예시는 아래와 같습니다. 
"""

# ╔═╡ 489b4d45-095d-4e8d-84bc-25fef5549564
function usesonly(word, available)
    for letter in word
        if letter ∉ available
            return false
        end
    end
    true
end

# ╔═╡ 3363e4c0-d684-4e28-93da-1c57453b48b4
usesonly("icecream", "aceimr")

# ╔═╡ c37a9cbd-601e-45c6-aa1a-819e83f712f6
md"""
usesonly를 조금만 변형해보면 9-5 문제였던 **usesall**도 풀 수 있습니다. 

이렇게 여러 코드를 작성하다 보면 분명 겹치는 부분이 생기고 이를 모듈화함으로 코드의 길이와 작업량을 대폭 감소시킬 수 있지요.

연습 문제를 직접 풀어보았다면 분명 같은 생각을 해보셨을거라 믿습니다.
"""

# ╔═╡ 25799e55-fce3-4391-9a31-0c889a74d52a
function usesall(word, required)
    usesonly(required, word)
end

# ╔═╡ f5f626d5-45e1-45d8-96d4-cbb7ec02303d
md"""
## 9.3 인덱스가 있는 루프
"""

# ╔═╡ 4d9f9c9f-cccc-4441-acd4-8c68d33c1d7e
md"""
연습문제 9-6 **isabecedarian**를 구현하기 위해서는 단순 검색과 더불어 현재 검색 중인 위치 즉, 인덱스도 함께 다루어야 합니다. 

이러한 경우 1)for 2)while 3)재귀함수를 사용해 볼 수 있으며 문제를 해결하였더라도 다른 방법으로 구현해보는 것도 좋은 연습이 되리라 생각합니다.
"""

# ╔═╡ 7168c9ad-d12b-46b4-a608-25e0c9ce8295
md"""
> 강의에서는 제일 직관적인 while loop의 예시를 살펴보겠습니다. 다른 두 경우에 대해서도 힌트로 남겨두니 구현 후 확인해보세요!
"""

# ╔═╡ 1eccf2ef-605c-45da-8f96-e02f5f4b5506
md"""
!!! hint "For-loop 구현"
	```julia
	function isabecedarian(word)
	    i = firstindex(word)
	    previous = word[i]
	    j = nextind(word, i)
	    for c in word[j:end]
	        if c < previous
	            return false
	        end
	        previous = c
	    end
	    true
	end	
	```
	
"""

# ╔═╡ ef6bab11-c93c-4070-9ea4-3ea2f439d325
md"""
!!! hint "While-loop 구현"
	```julia
	function isabecedarian(word)
	    i = firstindex(word)
	    j = nextind(word, 1)
	    while j <= sizeof(word)
	        if word[j] < word[i]
	            return false
	        end
	        i = j
	        j = nextind(word, i)
	    end
	    true
	end	
	```
	
"""

# ╔═╡ 34d7e3cc-c5ed-4923-a3e4-1fa63855b8f6
function isabecedarian(word)
    i = firstindex(word)
    j = nextind(word, 1)
    while j <= sizeof(word)
        if word[j] < word[i]
            return false
        end
        i = j
        j = nextind(word, i)
    end
    true
end

# ╔═╡ 5d323ab6-24a1-41b2-ad78-e909cc18301a
md"""
인접한 두 알파벳을 비교해야 하며 창문이 슬라이딩하듯이 인덱스 i와 j를 매번 하나씩 증가시켜야 합니다.

따라서 매 step마다 i = j / j = nextind 로 갱신을 시키는 것이지요. 
"""

# ╔═╡ 40b801e6-68df-44cc-bb34-f422a7be02e1
md"""
> 이렇게 해서 또 하나의 사례 연구 챕터를 완료하였습니다. 이제 Julia 코드 작성에 대해서도 많은 내공을 쌓게 되셨으리라 생각합니다. 마지막으로 추가 연습문제들을 남겨두니 차근차근 풀어보신 뒤 넘어가주세요.
"""

# ╔═╡ 7ca27f5a-261a-4a96-94c5-a0dfe4d293d3
md"""
!!! notes
	마지막 두개의 문제들은 미국의 라디오 프로그램 [Car Talk Puzzler 코너](https://www.cartalk.com/radio/puzzler)에 바탕을 둡니다
"""

# ╔═╡ 1f5fb439-f871-4146-9f61-bf08c9f1e055
md"""
### 연습 9-7
---
> 두 개의 글자가 붙어 있는 곳이 연달아 세 개인 단어를 찾아보자. 이 조건에 거의 만족하는, 그렇지만 정확하게는 만족하지는 못하는 단어 몇 개를 알려줄게. 예를 들어 committee가 있어. 숨어 있는 i가 없었다면 완벽했을 텐데 아쉽지. 또 Mississippi가 있어. 만약 i를 들어낼 수 있다면 만족시킬 수 있겠지만, 안 되지. 세 쌍의 글자가 연달아 붙어 있는 단어가 하나 있는데, 내가 알기론 그게 유일한 단어일 거야. 그 단어가 뭘까?

이 문제의 답을 찾는 프로그램을 작성하세요.

"""

# ╔═╡ 1135b425-2181-4957-8324-33e3e724c3cb
md"""
### 연습 9-8
---
> 최근에 어머니 댁에 방문했는데, 내 나이의 숫자를 뒤집으면 어머니 나이더라고. 예를 들어 어머니 가 73세라면, 나는 37세인 거지. 우리는 이런 일이 얼마나 자주 일어나는지 궁금했지만, 이야기가 옆길로 새는 바람에 답을 찾지는 못했어. 집에 와서 생각해보니까, 지금까지 6번 그런 일이 있었더라고. 그리고 깨달았지. 운이 좋으면 몇 년 안에 그런 일이 또 일어날 것이고, 진짜 진짜 운이 좋으면 한 번 더 그런 일이 있을 거라는 것을 말야. 다르게 얘기하면, 다 합쳐서 그런 일은 8번 일어날 수 있는 거였어. 자 질문은 말야, 지금 내가 몇 살이게?

이 문제의 답을 찾는 프로그램을 작성하세요.

"""

# ╔═╡ Cell order:
# ╟─a193f7b0-015d-11ef-2cd8-8b90df9391a2
# ╟─f6210c3d-518a-45ac-ba39-2be8095394fe
# ╠═4430884b-558a-41b6-8c21-1ba97b840b57
# ╟─40257df1-7dc4-4461-a9ed-90e99f3b6f05
# ╠═f6872e68-c46f-40b6-aa9e-9939ac4ed139
# ╟─d4c41e89-6cad-4543-9aac-37f6a774c731
# ╟─9d572b74-58b8-434c-8149-ab8a20c30011
# ╠═0e65ed59-5b5e-4b0b-9884-2714b484df4e
# ╟─e066a8da-6271-4304-aed4-19cd67b07086
# ╠═300305e6-a3f1-4d65-a943-57e1499c2ebc
# ╟─3dfe54dc-a246-47e9-96b7-40fd7184e77a
# ╟─be3369ef-4bab-4cc6-af37-106b7ba7df0c
# ╠═eeaf2d20-3e29-4632-9c6a-62c1aec38196
# ╟─0e1286b6-03bd-444e-8091-e7bb720bc196
# ╟─c6a08061-7192-45e8-9f73-c9f549415aac
# ╟─7b397589-bcbd-4a11-ad23-043ef40f67ec
# ╟─79c2710c-1a59-42d7-877a-9e4e96fb2efb
# ╟─dd5d884f-be47-4c7a-b8df-ca45a3b6fc5e
# ╟─6dcabe0b-6ba2-4526-addc-119ee74f9802
# ╟─c5a167f9-9809-41fa-ab3e-5f8919275316
# ╟─0217eeef-0b28-468a-9a20-9998b5fcbcdf
# ╟─d52b15ee-4b27-4856-b292-964e88091e24
# ╠═36d1ca3d-2ad1-452c-943a-8c43092474fd
# ╠═edc6908d-3c90-4d69-815d-8f92c3687996
# ╟─fb12668f-33a5-4804-8824-9d17965d8081
# ╠═489b4d45-095d-4e8d-84bc-25fef5549564
# ╠═3363e4c0-d684-4e28-93da-1c57453b48b4
# ╟─c37a9cbd-601e-45c6-aa1a-819e83f712f6
# ╠═25799e55-fce3-4391-9a31-0c889a74d52a
# ╟─f5f626d5-45e1-45d8-96d4-cbb7ec02303d
# ╟─4d9f9c9f-cccc-4441-acd4-8c68d33c1d7e
# ╟─7168c9ad-d12b-46b4-a608-25e0c9ce8295
# ╟─1eccf2ef-605c-45da-8f96-e02f5f4b5506
# ╟─ef6bab11-c93c-4070-9ea4-3ea2f439d325
# ╠═34d7e3cc-c5ed-4923-a3e4-1fa63855b8f6
# ╟─5d323ab6-24a1-41b2-ad78-e909cc18301a
# ╟─40b801e6-68df-44cc-bb34-f422a7be02e1
# ╟─7ca27f5a-261a-4a96-94c5-a0dfe4d293d3
# ╟─1f5fb439-f871-4146-9f61-bf08c9f1e055
# ╟─1135b425-2181-4957-8324-33e3e724c3cb
