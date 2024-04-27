### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ 552ca602-0393-11ef-3013-abde7f67d7ee
md"""
# Sooyoung Kim's Think Julia 

![image](https://github.com/kimsooyoung/ThinkJulia/assets/12381733/260603e2-20ed-428e-b15b-0381f73fb46c)
"""

# ╔═╡ 16efa2b8-50bb-4c14-9a61-b9197e074835
md"""
## Arrays (배열)
"""

# ╔═╡ d31a2bdc-7ff8-4d7a-8f15-3d1b71bfee0b
md"""
## 10.1 배열은 순열이다.
"""

# ╔═╡ 74e7bc73-f544-4e1c-a6bd-02522fc5f58c
md"""
배열은 문자열과 유사하게 같은 형태의 데이터 여러개를 묶어놓은 순열 자료형입니다. 문자열에서는 문자를 묶어두었지만 배열은 어떠한 데이터도 결합할 수 있고, 서로 다른 데이터들도 결합할 수 있습니다.

배열을 구성하는 각 데이터들을 원소(element)라고 하며, 배열은 각 원소들을 대괄호 안에 집어넣은 형태로 표현하고 정의합니다. 
"""

# ╔═╡ 62627c1a-d809-452a-939a-eb7430173c8b
begin
	@show num_arr = [1,2,3,4]
	@show string_arr = ["abc", "ㄱㄴㄷ", "あいうえお", "ﺎﺐﺖﺚ"]
	@show mixed_str = [1.0, -2, "hello", true]
end

# ╔═╡ cbdef4ad-45e8-48c5-afc9-9706a2d76b19
md"""
배열은 심지어 배열도 원소로 삼을 수 있습니다. 이러한 경우를 nested array라고 부르며 배열 안에 배열 안에 배열... 과 같이 중첩할 수 있는 제한은 없습니다.
"""

# ╔═╡ 5e270a1a-9954-4b46-a420-caf74bdbdf57
nested_arr = ["apple", 3.14, [-1, -2]]

# ╔═╡ 99620c61-b05b-4aae-9f04-a7a3ecf52930
md"""
추가로 아무 원소도 갖고 있지 않은 배열은 빈 배열이라고 하며 아무것도 없는 대괄로호 정의가 가능합니다.
"""

# ╔═╡ 49dc6ebb-9ba4-401b-acc4-8a38f250bd9d
empty_arr = []

# ╔═╡ 52bf5fd6-96ea-43e8-8f8a-45429fdd679e
md"""
**typeof** 함수를 사용해 배열이 담고 있는 원소들의 데이터 형식을 알 수 있습니다. ( 단, 모든 원소가 같은 자료형을 갖고 있는 경우에만 해당되고 여러 자료형이 섞인 경우 **Any**로 표기됩니다.
"""

# ╔═╡ 561f082b-a45d-4c14-8f8b-4f15a99a150c
begin
	@show typeof(num_arr)
	@show typeof(empty_arr)
	@show typeof(mixed_str)
	@show sizeof(mixed_str)
end

# ╔═╡ 31f08aba-5f37-44ea-97d2-ed7d604c4711
md"""
## 10.2 배열은 Mutable(가변)이다.
"""

# ╔═╡ 2b1ec603-f11f-461d-8fef-e287ca09b2ea
md"""
기억하실지 모르겠지만 이전 문자열은 중간값을 바꿀 수 없었습니다. 인덱싱을 통해 오류가 난 경우 해당 문자를 수정한 새로운 문자열을 선언했어야 했습니다.
"""

# ╔═╡ e8cb4912-83b4-4b86-9805-9fd2b241a8c9
begin
	my_string_mistake = "Hello Yorld"
	my_string_mistake[7] = 'W'
	# my_string_correct = my_string_mistake[1:6] * 'W' * my_string_mistake[8:end]
end

# ╔═╡ 182f0a9b-f95e-4fd8-8a2b-39d8e7281c5f
md"""
하지만 배열은 초기 선언 이후 얼마든지 원소를 수정할 수 있습니다. 다만, 기존 원소와 동일한 자료형을 사용하는 수정만 가능하지요.
"""

# ╔═╡ 1b90a237-b0bb-4ada-855f-293b3b918088
begin
	fruits = ["apple", "banana", "orange", "kiwi", "strawberry"]
	fruits[1] = "melon"
end

# ╔═╡ c0534c1b-4fc7-4178-ac2c-b0372be247e6
md"""
문자열 시간에 배웠던 ∈ 연산자도 배열에서 동일하게 사용 가능합니다.
"""

# ╔═╡ 0b8bb306-45a5-4a69-87eb-b002a3e113ee
begin
	@show "pear" ∈ fruits
end

# ╔═╡ 728467c4-2805-44d0-ac07-4b78640ec9c1
md"""
## 10.3 배열의 Traversing(순회) 
"""

# ╔═╡ a01fcc4d-e0f4-4c61-84ac-066af0485ffe
md"""
배열 내에 존재하는 모든 원소들을 차례대로 print하고 싶은 경우 아래와 같이 for-loop을 통한 순회가 가능합니다.
"""

# ╔═╡ ad47bc12-f8b5-4e25-8929-d4b4c51c7dc8
for fruit in fruits
    println(fruit)
end

# ╔═╡ dafdf809-4267-4fb3-b604-7518084161f0
md"""
하지만 이는 배열 내 원소들의 값을 읽을 때만 사용 가능하며, 원소를 수정하고 싶다면 결국 인덱스를 통한 접근이 필요합니다. 이런 상황에서 Julia의 내장 함수 **eachindex**를 사용할 수 있습니다.
"""

# ╔═╡ 389ddcb2-e11c-4b20-9a43-1edbe8e5659d
for i in eachindex(fruits)
    fruits[i] = "I love " * fruits[i]
end

# ╔═╡ 3da5f4a1-d62e-462d-b5b4-e9fe564a235a
@show fruits

# ╔═╡ 27db08df-e0b4-458e-b947-b1f9b51ff475
md"""
length 함수는 배열 내 원소의 개수를 알려줍니다. 배열 안에 배열이 있는 경우라도 이는 하나의 원소로 카운트합니다.
"""

# ╔═╡ e8ae4140-b583-4f95-9862-39bc7bc6c5eb
begin
	@show length(fruits)
	@show length([])
	@show length(nested_arr)
end

# ╔═╡ c38ac06f-d11c-4f31-96f8-3fdc6f77c86a
md"""
## 10.4 배열 자르기(slicing) 
"""

# ╔═╡ 98665fb3-5c55-4092-bc6e-6f75f892aa25


# ╔═╡ 38078e41-8b2c-43e5-bf44-7cc0731ab799
md"""
### 연습 9-1
---
> words.txt 파일 내 단어 중에서, 길이가 20글자 이상인 단어만 출력하는 프로그램을 작성해보세요. (모든 단어는 영어로 구성되어 있습니다.)
"""

# ╔═╡ Cell order:
# ╟─552ca602-0393-11ef-3013-abde7f67d7ee
# ╟─16efa2b8-50bb-4c14-9a61-b9197e074835
# ╠═d31a2bdc-7ff8-4d7a-8f15-3d1b71bfee0b
# ╟─74e7bc73-f544-4e1c-a6bd-02522fc5f58c
# ╠═62627c1a-d809-452a-939a-eb7430173c8b
# ╟─cbdef4ad-45e8-48c5-afc9-9706a2d76b19
# ╠═5e270a1a-9954-4b46-a420-caf74bdbdf57
# ╟─99620c61-b05b-4aae-9f04-a7a3ecf52930
# ╠═49dc6ebb-9ba4-401b-acc4-8a38f250bd9d
# ╟─52bf5fd6-96ea-43e8-8f8a-45429fdd679e
# ╠═561f082b-a45d-4c14-8f8b-4f15a99a150c
# ╟─31f08aba-5f37-44ea-97d2-ed7d604c4711
# ╟─2b1ec603-f11f-461d-8fef-e287ca09b2ea
# ╠═e8cb4912-83b4-4b86-9805-9fd2b241a8c9
# ╟─182f0a9b-f95e-4fd8-8a2b-39d8e7281c5f
# ╠═1b90a237-b0bb-4ada-855f-293b3b918088
# ╟─c0534c1b-4fc7-4178-ac2c-b0372be247e6
# ╠═0b8bb306-45a5-4a69-87eb-b002a3e113ee
# ╟─728467c4-2805-44d0-ac07-4b78640ec9c1
# ╟─a01fcc4d-e0f4-4c61-84ac-066af0485ffe
# ╠═ad47bc12-f8b5-4e25-8929-d4b4c51c7dc8
# ╟─dafdf809-4267-4fb3-b604-7518084161f0
# ╠═389ddcb2-e11c-4b20-9a43-1edbe8e5659d
# ╠═3da5f4a1-d62e-462d-b5b4-e9fe564a235a
# ╟─27db08df-e0b4-458e-b947-b1f9b51ff475
# ╠═e8ae4140-b583-4f95-9862-39bc7bc6c5eb
# ╟─c38ac06f-d11c-4f31-96f8-3fdc6f77c86a
# ╠═98665fb3-5c55-4092-bc6e-6f75f892aa25
# ╟─38078e41-8b2c-43e5-bf44-7cc0731ab799
