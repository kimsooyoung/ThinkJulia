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
> 배열 내에 존재하는 모든 원소들을 차례대로 print하고 싶은 경우 아래와 같이 for-loop을 통한 순회가 가능합니다.
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

# ╔═╡ 02b261d1-2915-4717-831b-fa181f1cd8ac
md"""
> 대괄호 연산을 통해 배열의 일부를 참조하는 slicing 작업도 매우 자주 사용됩니다. 
"""

# ╔═╡ 98665fb3-5c55-4092-bc6e-6f75f892aa25
begin
	kor_abc = ['ㄱ', 'ㄴ', 'ㄷ', 'ㄹ', 'ㅁ', 'ㅂ']
	@show kor_abc[1:3]
end

# ╔═╡ eee77df0-0e3f-4ddc-9612-ae443ad45169
md"""
특히 배열은 가변(mutable)이기 때문에 생각 없이 코딩을 하다 보면 본래 배열값이 어느 순간 바뀌어 예상치 못한 오류가 생길 수 있지요. 

때문에 기존 배열의 복사본을 만들어두곤 하며, 이 때 **[:]**를 사용하면 손쉽게 기존 배열의 복사본을 만들 수 있습니다.
"""

# ╔═╡ 863d56d3-37a6-409a-a916-98574f977ce0
begin
	kor_abc_copy = kor_abc[:]
	kor_abc[1:3] = ['a', 'b', 'c']
	println(kor_abc, kor_abc_copy)
end

# ╔═╡ a2da355e-4758-41ea-ad8f-d0cd9c0e7fc0
md"""
## 10.5 Built-in 배열 Library 
"""

# ╔═╡ 0d2c526e-7530-436c-ae87-1da18a09f49d
md"""
> Julia에는 배열을 다루는 여러 유용한 함수들이 내장되어 있습니다. 이들에 대해서 간단히 하나씩 짚고 넘어가겠습니다.

* **push!(<array>, <new-element>)** : array의 맨 마지막 원소로 new element를 삽입합니다.
"""

# ╔═╡ b0acd668-bdc6-46b4-9bcb-916c907dc6b7
begin
	my_favo_fruits = ["banana", "melon", "orange"]
	push!(my_favo_fruits, "mango")

	print(my_favo_fruits)
end

# ╔═╡ cc8fbe70-7e04-425e-a73c-c24b14ac573c
md"""
* **append!(<array1>, <array2>)** : array1에 이어서 array2를 이어 붙입니다. array1은 변하지만 array2는 그대로 유지된다는 사실에 주의합니다.
"""

# ╔═╡ e095c534-e940-4bf3-9bab-3b9e6efa04bf
begin
	kor_last_names = ["kim", "lee", "park", "choi"]
	kor_last_names2 = ["jeong", "kang", "cho", "hwang"]
	append!(kor_last_names, kor_last_names2)

	print(kor_last_names)
end

# ╔═╡ 0e1cd334-5ab2-4243-a40f-d33915b116a8
md"""
* **sort!(<array>)** : array를 정렬합니다. 문자의 경우 알파벳 순으로, 숫자의 경우 작은 크기 순으로 정렬됩니다.
"""

# ╔═╡ 5f8492b7-597f-4be3-9f0d-c60f44a1c663
begin
	sort!(kor_last_names)
	
	print(kor_last_names)
end

# ╔═╡ e0631198-06e4-4f5c-b29f-006ac5af8893
md"""
!!! notes
	Julia에서는 입력 매개변수를 변형시키는 함수의 경우 함수명 뒤에 느낌표(!)를 붙이는 관행이 있습니다. sort() 함수는 정렬된 배열을 반환하는 반면, sort!()함수는 입력 자체를 변형시키지요.
"""

# ╔═╡ bb1d9ee7-18ff-4286-9fbf-a56ee268a1bc
import Random

# ╔═╡ 0546cf14-366c-4378-a7b0-820b09de924a
let
	rand_shuffle = Random.randperm(length(kor_last_names))
	kor_last_names = [ name for name in kor_last_names[rand_shuffle] ]

	@show sort(kor_last_names)
	@show kor_last_names
	
	@show sort!(kor_last_names)
	@show kor_last_names
end

# ╔═╡ 2e382668-889c-44da-b788-61e0951c16fc
md"""
## 10.6 Map, Filter, Reduce 
"""

# ╔═╡ 225800fe-f34b-4631-ba2d-78529cf399aa
md"""
> 배열을 다루는 대부분의 작업은 map / filter / reduce 라는 패턴을 갖습니다. 

배열을 순회하면서 모든 원소에 동일한 작업을 적용하거나(map), 조건을 만족하는 원소만 추려낸다거나(filter), 원소의 모두를 대표하는 하나의 결과를 누적한다거나(reduce) 하는 것이지요.

이는 함수형 프로그래밍에서 가장 처음 배우는 패턴이기도 합니다.

**map example**
"""

# ╔═╡ 4604a344-ff7f-4d37-a0ff-47968bee0b23
function capitalizeall(t)
    res = []
    for s in t
        push!(res, uppercase(s))
    end
    res
end

# ╔═╡ ea0473de-b6d5-419b-9c49-0f5c0f63da7f
capitalizeall(['h', 'E', 'l', 'L', 'o'])

# ╔═╡ 1aa61545-bcdd-4d0e-b6ac-de9a49de98cf
md"""
**filter example**
"""

# ╔═╡ 0525a29c-254c-401f-a4e3-01912517eeb3
function onlyupper(t)
    res = []
    for s in t
        if s == uppercase(s)
            push!(res, s)
        end
    end
    res
end

# ╔═╡ be201db7-294b-4a9c-809e-f69bc74b26c7
onlyupper(['h', 'E', 'l', 'L', 'o'])

# ╔═╡ 3add1925-bc4f-43c8-b9b3-49cb2cb252d8
md"""
**reduce example**
"""

# ╔═╡ 8aba8070-eef4-4198-83c7-7a0e4e00ccaa
function addall(t)
    total = 0
    for x in t
        total += x
    end
    total
end

# ╔═╡ 07b2188c-c864-43bd-bc1b-c620b8f81e52
addall([-2, -1, 0, 1, 2, 3, 4])

# ╔═╡ d1073d11-8d1e-4229-9dd9-6e4b98a895f5
md"""
## 10.7 Dot 연산자
"""

# ╔═╡ 82d514a5-e149-4fee-b220-6865bac898f2


# ╔═╡ 38078e41-8b2c-43e5-bf44-7cc0731ab799
md"""
### 연습 9-1
---
> words.txt 파일 내 단어 중에서, 길이가 20글자 이상인 단어만 출력하는 프로그램을 작성해보세요. (모든 단어는 영어로 구성되어 있습니다.)
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Random = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"
"""

# ╔═╡ Cell order:
# ╟─552ca602-0393-11ef-3013-abde7f67d7ee
# ╟─16efa2b8-50bb-4c14-9a61-b9197e074835
# ╟─d31a2bdc-7ff8-4d7a-8f15-3d1b71bfee0b
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
# ╟─02b261d1-2915-4717-831b-fa181f1cd8ac
# ╠═98665fb3-5c55-4092-bc6e-6f75f892aa25
# ╟─eee77df0-0e3f-4ddc-9612-ae443ad45169
# ╠═863d56d3-37a6-409a-a916-98574f977ce0
# ╟─a2da355e-4758-41ea-ad8f-d0cd9c0e7fc0
# ╟─0d2c526e-7530-436c-ae87-1da18a09f49d
# ╠═b0acd668-bdc6-46b4-9bcb-916c907dc6b7
# ╟─cc8fbe70-7e04-425e-a73c-c24b14ac573c
# ╠═e095c534-e940-4bf3-9bab-3b9e6efa04bf
# ╟─0e1cd334-5ab2-4243-a40f-d33915b116a8
# ╠═5f8492b7-597f-4be3-9f0d-c60f44a1c663
# ╟─e0631198-06e4-4f5c-b29f-006ac5af8893
# ╠═bb1d9ee7-18ff-4286-9fbf-a56ee268a1bc
# ╠═0546cf14-366c-4378-a7b0-820b09de924a
# ╟─2e382668-889c-44da-b788-61e0951c16fc
# ╟─225800fe-f34b-4631-ba2d-78529cf399aa
# ╠═4604a344-ff7f-4d37-a0ff-47968bee0b23
# ╠═ea0473de-b6d5-419b-9c49-0f5c0f63da7f
# ╟─1aa61545-bcdd-4d0e-b6ac-de9a49de98cf
# ╠═0525a29c-254c-401f-a4e3-01912517eeb3
# ╠═be201db7-294b-4a9c-809e-f69bc74b26c7
# ╟─3add1925-bc4f-43c8-b9b3-49cb2cb252d8
# ╠═8aba8070-eef4-4198-83c7-7a0e4e00ccaa
# ╠═07b2188c-c864-43bd-bc1b-c620b8f81e52
# ╟─d1073d11-8d1e-4229-9dd9-6e4b98a895f5
# ╠═82d514a5-e149-4fee-b220-6865bac898f2
# ╟─38078e41-8b2c-43e5-bf44-7cc0731ab799
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
