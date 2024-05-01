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

* **map example** : array t를 순회하며 모든 원소 s를 대문자로 변환하고, 이를 res라는 결과 배열에 추가시킵니다.
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
* **filter example** : array s를 순회하면서 대문자인 원소만 걸러낸 뒤 return array res에 추가합니다. 
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
* **reduce example** : array t를 순회하면서 모든 원소들을 차례차례 누적 덧셈합니다.
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

# ╔═╡ 0817a86a-0f2a-487d-bef7-b2f11bb5c326
md"""
!!! notes
	사실 Julia에서는 sum()이라는 내장 함수를 이미 제공하고 있답니다.
"""

# ╔═╡ d1073d11-8d1e-4229-9dd9-6e4b98a895f5
md"""
## 10.7 Dot 연산자
"""

# ╔═╡ 82d514a5-e149-4fee-b220-6865bac898f2
begin
	dot_arr = [1, 2, 3, 4]
	@show dot_arr .+ 1
	@show dot_arr .^ 2
end

# ╔═╡ 7f14d615-7b0b-422f-92ae-b4993c202d30
md"""
위 코드 결과를 살펴보면, 기존 배열의 모든 원소들에 모두 1을 더하고, 모두 제곱을 취한 것을 알 수 있습니다.

> 이렇게 배열의 모든 항에 공통된 작업을 하고 싶다면 연산자 앞에 dot(.)를 불여주면 됩니다.
"""

# ╔═╡ 2cc38e58-51ff-4988-b639-76735f2c5856
begin
	str_arr = ['k', 'o', 'r', 'e', 'a']
	@show uppercase.(str_arr)
end

# ╔═╡ 3e7e30e6-2bfe-48ea-9399-a0a0f478627c
md"""
dot 연산자는 함수에도 적용됩니다. 위 코드와 같이 문자열로 이루어진 배열의 원소들을 모두 대문자로 만들고 싶다면 **uppercase.**의 형태로 함수 + dot 연산자 사용 시 매우 편리합니다. 
"""

# ╔═╡ 2a5c21a6-4fe4-46c3-a2d4-96682d3f77e8
md"""
## 10.8 Deleting and Inserting
"""

# ╔═╡ 702ff934-6985-4b31-8979-5e0eb9bef7ea
md"""
> 앞서 배열 내 원소의 추가 시 사용하는 push, append에 대해서 배워보았습니다. 이번에는 배열 내 원소의 삭제, 그리고 특정 위치에 원소를 추가하고자 하는 경우 사용하는 함수들을 배워봅시다.
"""

# ╔═╡ e131b121-a6f6-491a-af35-66932c433efd
md"""
* **insert!(<array>, <index>, <element>)** : array에 원소 element를 삽입합니다. 다만, 삽입하는 위치는 index로 지정합니다. 기존 index 위치에 있던 원소들은 하나씩 모두 뒤로 밀리는 결과를 얻게 됩니다.
"""

# ╔═╡ 7a3d2c51-1a11-4fc9-a0cc-2424f716a621
let
	kor_abc = ['ㄱ', 'ㄴ', 'ㄹ']
	print(insert!(kor_abc, 3, 'ㄷ'))
end

# ╔═╡ 06d20366-30f1-4916-b3ab-def027b7f73b
md"""
* **pop!(<array>)** : 배열의 가장 마지막 원소를 제거하고 이를 return 합니다. 느낌표가 붙은 함수이므로 기존 배열을 수정하는 함수이겠지요?
"""

# ╔═╡ ffbdc6b4-a8ff-4bcf-bb08-a349f84003bc
let
	kor_abc = ['ㄱ', 'ㄴ', 'ㄹ']
	print(pop!(kor_abc), kor_abc)
end

# ╔═╡ 92a3f534-ad12-4f5a-8166-efeb0a522bce
md"""
* **popfirst!(<array>)** : 배열의 첫 원소를 제거하고 이를 return 합니다.
"""

# ╔═╡ 9dcc1f1a-b71e-4d0f-82ed-3f8b27dd3c22
let
	kor_abc = ['ㄱ', 'ㄴ', 'ㄹ']
	print(popfirst!(kor_abc), kor_abc)
end

# ╔═╡ 47d74de2-9843-42b3-a9a9-9cae8cb72acf
md"""
* **splice!(<array>, <index>)** / **deleteat!(<array>, <index>)** : index자리에 있는 원소를 제거합니다. 이 때, splice!는 제거한 원소를 return하지만 deleteat!은 원소를 제거만 하고 변경된 배열 자체를 return합니다.
"""

# ╔═╡ 4d406dcc-ec46-48e4-aef6-a6b454ec1aee
let
	kor_abc = ['ㄱ', 'ㄴ', 'ㄹ']
	@show splice!(kor_abc, 1), kor_abc

	kor_abc = ['ㄱ', 'ㄴ', 'ㄹ']
	@show deleteat!(kor_abc, 1)
end

# ╔═╡ 8450395a-3493-42d0-b689-05293e8db29a
md"""
## 10.9 배열과 문자열
"""

# ╔═╡ 7e928f67-73c1-4f8f-951c-3eae867c5d77
md"""
배열과 문자열 모두 순열 자료형이지만, 문자열은 문자로만 이루어지고 불변이라는 점, 배열은 어떠한 형태로도 구성될 수 있지만변할 수 있다는 점이 포인트였습니다. 

> 배열과 문자열은 이렇게 다른 자료형인데, 이들 사이 변환은 어떻게 할 수 있는지에 대해서 알아보겠습니다.
"""

# ╔═╡ 733939f8-e95b-41e4-80e3-5f5049698a35
md"""
문자열 => 배열로의 변환은 **collect** 함수를 사용합니다.
"""

# ╔═╡ 4fa9b474-978e-4d4f-88f8-0ff0795c20a6
begin
	ppap = "pen pineapple apple pen"
	@show collect(ppap)
end

# ╔═╡ e422a6aa-0f95-4e39-bd70-5498f0d85aaa
md"""
collect 함수는 모든 문자를 쪼개어 배열로 만들었습니다. 단어 단위로 쪼개고 싶은 경우, **split**함수를 사용합니다.
"""

# ╔═╡ 5182fe22-a499-40a6-8c25-a059fdebf687
begin
	@show split(ppap)
end

# ╔═╡ 9b3aafe0-c1ff-470d-914c-d6c9fd227801
md"""
반복되는 특정 문자를 기준으로 split을 수행하고 싶다면 두 번째 매개변수로 해당 문자를 전달하면 됩니다.

!!! notes
	이 특정 문자는 구분 문자(Delimiter)라고 부릅니다.
"""

# ╔═╡ b9babfab-99e3-40a0-980d-d2aa263ecba7
begin
	ppap2 = "pen-pineapple-apple-pen"
	ppap_split = split(ppap2, '-')
	
	print(ppap_split)
end

# ╔═╡ b2f36df6-da57-4739-a7b2-b75db5fe1fc2
md"""
배열 => 문자열로의 변환은 join 이라는 함수를 사용합니다. join도 split과 유사하게 두 번째 매개변수로 Delimiter를 전달 가능합니다.
"""

# ╔═╡ 06c362e3-6dbb-493f-b632-a9978e2480ff
begin
	ppap_join = join(ppap_split, '-')
	@show ppap_join
end

# ╔═╡ 41f5c4b9-7735-4745-b24b-d92caa5b6008
md"""
## 10.10 Object와 Value, 그리고 Alias
"""

# ╔═╡ 36132689-eced-410a-9179-bb0cc0a89eed
md"""
> 순열 자료형을 가진 변수들에 대해서 두 변수가 동일하다고 말할 수 있으려면 어떠한 조건을 만족해야 할까요? 단순히 모든 원소가 동일하면 될까요?

아래의 두 코드를 살펴봅시다.
"""

# ╔═╡ 7edd205b-249d-469c-ae29-d1572ed28e64
begin
	a = "banana"
	b = "banana"

	a === b
end

# ╔═╡ 0b367f75-6b66-4c3c-b022-f4a2b0b4897f
begin
	a_arr = [1,2,3]
	b_arr = [1,2,3]

	a_arr === b_arr
end

# ╔═╡ ca338066-2ba9-4f52-bbce-3c15925fb7d6
md"""
불변인 자료형, 문자열에 대해서는 두 문자열의 원소가 모두 동일할 시 완벽하게 같다고 취급됩니다. 

하지만 배열의 경우 변할 가능성을 가진 자료형이기 때문에 단순히 현재 원소들이 같다고 해서 두 변수가 일치하다고 볼 수 없습니다.
"""

# ╔═╡ 1b303e8c-abcc-4f0b-aa97-6bf33484dd2c
begin
	a_arr[1] = 10

	@show a_arr, b_arr
end

# ╔═╡ 59b65af6-0943-4232-8bc5-1b5163adf259
md"""
반면, 배열을 하나 선언한 뒤, **=** 연산자를 통해 그 배열과 동일한 새로운 배열을 선언할 시, 두 변수는 완벽하게 같은 메모리를 참조하게 됩니다.
"""

# ╔═╡ 1ff26860-daf1-420f-88c9-62120a46944b
begin
	c_arr = [2, 3, 4]
	d_arr = c_arr

	c_arr === d_arr
end

# ╔═╡ 403293f3-2047-4132-b6e7-4bf1242108ed
md"""
변수 `c_arr`을 수정하면, `d_arr`도 변경되고, 그 역도 성립합니다. 이러한 경우에만 두 배열이 같다고 볼 수 있습니다.
"""

# ╔═╡ 76a65f11-5c9f-47af-993b-ff39562fad9a
begin
	c_arr[1] *= 10
	@show c_arr, d_arr

	d_arr[2] -= 5
	@show c_arr, d_arr
end

# ╔═╡ a72f19c3-93bb-4124-b909-240aa305d6da
md"""
## 10.11 함수 Arguments로서의 배열
"""

# ╔═╡ 39da9666-a0a1-4c62-94c2-360caf9c1fcd
function deletehead!(t)
    popfirst!(t)
end

# ╔═╡ 49ee33ff-7934-45db-811e-41e227fc2f14
begin
	test_arr = [4,5,6,7]
	deletehead!(test_arr)
end

# ╔═╡ 396e3c9d-9687-4bd7-a1ff-275d5ea1c40c
md"""
> 함수의 매개변수로 배열이 사용되는 위 경우, 본래 배열은 영향을 받게 될까요? 
"""

# ╔═╡ 9aab8d2a-4a0c-4ddf-bc20-3ed1f9b5ff91
@show test_arr

# ╔═╡ 9ff087d2-9e64-458f-a39e-bd4dd9970905
md"""
함수의 매개변수로 사용되는 시점, test_arr는 **자신과 동일한 t로 `(t === test arr)`** 함수 내부에 전달됩니다. 

popfirst!는 기존 배열을 수정하는 함수이기 때문에 t를 수정하면 test_arr도 수정되겠지요.
"""

# ╔═╡ 4e152095-e671-4ba4-8afc-a5da451e619c
function baddeletehead(t)
    t = t[2:end]
end

# ╔═╡ 1768fa25-7fa7-478e-8d46-53d615b1c982
md"""
!!! note
	이 경우는 어떨까요? [] 연산자를 통해 배열을 slicing하면 완전히 새로운 배열을 생성하는 것이라 했습니다. 함수 내에서 t를 수정하는 경우, 원본 배열도 과연 수정이 될까요?
"""

# ╔═╡ 1320af8f-1270-4de1-9056-f098917a48f5
@show baddeletehead(test_arr), test_arr

# ╔═╡ 7d75aa42-99fb-4ca1-8fb8-3805f80eed0f
md"""
> **원본 배열은 변하지 않았습니다. 의도한 대로 함수가 동작하지 않는 것이지요!**

이렇게 배열을 다루다보면 수정에 있어 놓치기 쉬운 오류들이 빈번하게 발생합니다. 따라서 아래와 같이 결과를 return하는 식으로 코딩하는 습관을 들이면 좋을 것 같습니다.
"""

# ╔═╡ eb489c42-e7b9-40db-9c34-7d912fdf8966
function tail(t)
    t[2:end]
end

# ╔═╡ 4e49382f-fd9f-40e3-9448-c0b87d6ec50d
begin
	letters = ['a', 'b', 'c']
	rest = tail(letters)

	print(rest)
end

# ╔═╡ 61576ab7-caa9-42da-91e2-468eb2773ba9
md"""
## 10.12 배열의 디버깅 포인트
"""

# ╔═╡ 80161349-f70d-487e-8c65-0369c1195517
md"""
> 이번 챕터 마지막으로 배열을 사용하는 프로그램에서 자주 실수하는 부분들과, 이를 방지하기 위한 팁을 전달하고자 합니다. 
"""

# ╔═╡ 93c514e7-6253-42fb-ab42-f06bf89067ac
md"""
* **원본을 수정하는 함수(! 계열)와 수정본을 return하는 함수 사이의 착각**
"""

# ╔═╡ 521d094e-cd10-4142-a1db-aef6281a5fd7
begin
	kor_abc_again = ['ㄷ', 'ㄴ', 'ㄱ', 'ㄹ']
	sort(kor_abc_again)
	@show kor_abc_again
end

# ╔═╡ 95564b8a-e2a7-4206-9f67-21c85829a031
md"""
sort() 함수는 **정렬된 결과를 return하는 함수**이며, **sort!()가 원본을 수정하는 함수**입니다. 따라서 위는 sort!를 써야 했는데 착각한 경우가 됩니다.
"""

# ╔═╡ f5b79a89-44e9-4eb4-b150-77d5669dd7e9
md"""
* **여러 비슷한 함수들 사이의 착각**

배열에 원소를 추가하는 것만 해도 insert, push, append 등 여러 방법이 있습니다. 여기서 insert, push는 원소를 삽입하지만 append는 두 배열끼리의 결합을 하지요. (python에서 append가 원소 삽입이기 때문에 자주 착각하게 되는 포인트입니다.)

```julia
insert!(t, 4, x)
push!(t, x)
append!(t, [x])
```
"""

# ╔═╡ 16b037c4-6120-439d-bfb1-a4e3930d4e72
md"""
* **원본의 복사본을 만들어두기**

배열은 mutable 자료형입니다. 때문에 언제, 어디서 수정이 이루어질지, 그로 인한 의도치 않은 결과를 얻게 될 지 모릅니다. 메모리 측면에서 효율적이지는 않지만 실수 방지를 위해 함수의 시작이나 배열에 접근하는 부분에서 원본 배열의 복사본을 만들어둡시다.

!!! notes
	배열의 복사본을 만드는 방법으로 대괄호 연산을 사용하면 매우 편리합니다. 
	```julia
	t = [3, 1, 2]
	t2 = t[:]
	```
"""

# ╔═╡ 38078e41-8b2c-43e5-bf44-7cc0731ab799
md"""
### 연습 10-1
---
아래와 같이 정수의 배열들을 원소로 가지는 배열을 인수로 받아, 중첩된 배열의 원소들을 모두 더한 결과를 반환하는 함수 **nestedsum**을 작성하세요.

```julia
julia> t = [[1, 2], [3], [4, 5, 6]];

julia> nestedsum(t)
21
```

"""

# ╔═╡ 8713588e-c74e-495c-b638-b4052d8455cb
md"""
### 연습 10-2
---
아래와 같이 숫자 배열을 받아 누적 합계를 구해서 반환하는 함수 **cumulsum**을 작성하세요. 새로 만들어진 배열의 i번째 원소 값은 원래 배열의 첫 번째부터 i번째까지의 원소들을 합한 값 입니다.

```julia
julia> t = [1, 2, 3];

julia> print(cumulsum(t))
Any[1, 3, 6]
```

"""

# ╔═╡ dd09f1a7-c6f5-4551-8eab-6a754f676865
md"""
### 연습 10-3
---
1. 아래와 같이 배열을 인수로 받아 첫 번째와 마지막 원소를 뺀 나머지를 원소를 가지는 배열을 반환하는 함수 interior를 작성하세요.

```julia
julia> t = [1, 2, 3, 4];

julia> print(interior(t))
[2, 3]
```

2. 앞선 interior와 동작은 같지만 원본을 수정하고, nothing을 반환하는 함수 **interior!**를 작성하세요.

```julia
julia> t = [1, 2, 3, 4];

julia> interior!(t)

julia> print(t)
[2, 3]
```

"""

# ╔═╡ 1833576b-1260-4d1e-bb48-74a7073d9bd9
md"""
### 연습 10-4
---
아래와 같이 배열을 인수로 받아, 배열이 오름차순으로 정렬되어 있으면 true를 반환하고, 그렇지 않으면 false를 반환하는 함수 **issort**를 작성하세요.

```julia
julia> issort([1, 2, 2])
true
julia> issort(['b', 'a'])
false
```

"""

# ╔═╡ 5eb38f50-3516-402c-832b-18504e6c1afd
md"""
### 연습 10-5
---
어떤 단어의 글자들을 재조합해서 새로운 유효한 단어를 만들 수 있으면, 그 두 단어는 서로의 애너그램(anagram)입니다. 두 개의 문자열을 인수로 받아, anagram인지 여부를 반환 하는 함수 **isanagram**을 작성하세요.
"""

# ╔═╡ 0ba89253-686d-4018-af9e-6b34acf4d970
md"""
### 연습 10-6
---
배열을 인수로 받아 배열 안에 중복된 원소가 있는지 여부를 반환하는 함수 **hasduplicate**를 작성하세요. 단, 원래 배열을 수정하면 안 됩니다.

"""

# ╔═╡ 9ea81116-3702-4f27-b651-95d74fdbb7de
md"""
### 연습 10-7
---
9장에 나왔던 words.txt 파일을 읽어 각 단어를 원소로 하는 배열을 생성하는 함수를 두 가지 버전으로 작성하세요. 하나는 **push!** 함수를 써야 하고, 다른 하나는 **t = [t..., x]** 구문을 써야 합니다. 

어느 쪽이 실행하는 데 더 오래 걸립니까? 이유는 뭘까요?
"""

# ╔═╡ 412d74b3-13a1-408f-abc5-f48244948ae0
md"""
### 연습 10-8
---
두 단어가 있는데, 한 단어의 글자 순서를 뒤집었을 때 다른 단어와 같아진다면, 이 두 단어를 'reverse pair'라고 합니다. 연습 10-9에서 생성한 단어 배열에서 뒤집힘 쌍을 모두 찾아 반환 하는 함수 **reversepairs**를 작성하세요.
"""

# ╔═╡ 0a21d431-bf99-42fe-9b8c-73fbab04fc10
md"""
### 연습 10-9
---
두 단어에서 한 글자씩 교대로 뽑아내서 만든 것이 단어가 된다면 이 두 단어가 'interlock'이라고 합니다. (예를 들어 'shoe'와 'cold'는 'schooled'를 만들 수 있기 때문에 맞물려 있습니다.)

1. 맞물려 있는 단어 쌍을 모두 찾아내는 프로그램을 작성하세요. 이 문제는 [http://puzzlers.org](http://puzzlers.org) 사이트를 참고했습니다.

!!! warning
	가능한 모든 단어 쌍에 대해 맞물려 있는지 검사하는 방식으로 짜면 안 됩니다!


2. 3중으로 맞물려 있는 단어를 찾아보세요. (세 단어에서 한 글자씩 교대로 뽑아 만든 문자열이 단어가 되는 경우입나다.)

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
# ╟─0817a86a-0f2a-487d-bef7-b2f11bb5c326
# ╟─d1073d11-8d1e-4229-9dd9-6e4b98a895f5
# ╠═82d514a5-e149-4fee-b220-6865bac898f2
# ╟─7f14d615-7b0b-422f-92ae-b4993c202d30
# ╠═2cc38e58-51ff-4988-b639-76735f2c5856
# ╟─3e7e30e6-2bfe-48ea-9399-a0a0f478627c
# ╟─2a5c21a6-4fe4-46c3-a2d4-96682d3f77e8
# ╟─702ff934-6985-4b31-8979-5e0eb9bef7ea
# ╟─e131b121-a6f6-491a-af35-66932c433efd
# ╠═7a3d2c51-1a11-4fc9-a0cc-2424f716a621
# ╟─06d20366-30f1-4916-b3ab-def027b7f73b
# ╠═ffbdc6b4-a8ff-4bcf-bb08-a349f84003bc
# ╟─92a3f534-ad12-4f5a-8166-efeb0a522bce
# ╠═9dcc1f1a-b71e-4d0f-82ed-3f8b27dd3c22
# ╟─47d74de2-9843-42b3-a9a9-9cae8cb72acf
# ╠═4d406dcc-ec46-48e4-aef6-a6b454ec1aee
# ╟─8450395a-3493-42d0-b689-05293e8db29a
# ╟─7e928f67-73c1-4f8f-951c-3eae867c5d77
# ╟─733939f8-e95b-41e4-80e3-5f5049698a35
# ╠═4fa9b474-978e-4d4f-88f8-0ff0795c20a6
# ╟─e422a6aa-0f95-4e39-bd70-5498f0d85aaa
# ╠═5182fe22-a499-40a6-8c25-a059fdebf687
# ╟─9b3aafe0-c1ff-470d-914c-d6c9fd227801
# ╠═b9babfab-99e3-40a0-980d-d2aa263ecba7
# ╟─b2f36df6-da57-4739-a7b2-b75db5fe1fc2
# ╠═06c362e3-6dbb-493f-b632-a9978e2480ff
# ╟─41f5c4b9-7735-4745-b24b-d92caa5b6008
# ╟─36132689-eced-410a-9179-bb0cc0a89eed
# ╠═7edd205b-249d-469c-ae29-d1572ed28e64
# ╠═0b367f75-6b66-4c3c-b022-f4a2b0b4897f
# ╟─ca338066-2ba9-4f52-bbce-3c15925fb7d6
# ╠═1b303e8c-abcc-4f0b-aa97-6bf33484dd2c
# ╟─59b65af6-0943-4232-8bc5-1b5163adf259
# ╠═1ff26860-daf1-420f-88c9-62120a46944b
# ╟─403293f3-2047-4132-b6e7-4bf1242108ed
# ╠═76a65f11-5c9f-47af-993b-ff39562fad9a
# ╟─a72f19c3-93bb-4124-b909-240aa305d6da
# ╠═39da9666-a0a1-4c62-94c2-360caf9c1fcd
# ╠═49ee33ff-7934-45db-811e-41e227fc2f14
# ╟─396e3c9d-9687-4bd7-a1ff-275d5ea1c40c
# ╠═9aab8d2a-4a0c-4ddf-bc20-3ed1f9b5ff91
# ╟─9ff087d2-9e64-458f-a39e-bd4dd9970905
# ╠═4e152095-e671-4ba4-8afc-a5da451e619c
# ╟─1768fa25-7fa7-478e-8d46-53d615b1c982
# ╠═1320af8f-1270-4de1-9056-f098917a48f5
# ╟─7d75aa42-99fb-4ca1-8fb8-3805f80eed0f
# ╠═eb489c42-e7b9-40db-9c34-7d912fdf8966
# ╠═4e49382f-fd9f-40e3-9448-c0b87d6ec50d
# ╟─61576ab7-caa9-42da-91e2-468eb2773ba9
# ╟─80161349-f70d-487e-8c65-0369c1195517
# ╟─93c514e7-6253-42fb-ab42-f06bf89067ac
# ╠═521d094e-cd10-4142-a1db-aef6281a5fd7
# ╟─95564b8a-e2a7-4206-9f67-21c85829a031
# ╟─f5b79a89-44e9-4eb4-b150-77d5669dd7e9
# ╟─16b037c4-6120-439d-bfb1-a4e3930d4e72
# ╟─38078e41-8b2c-43e5-bf44-7cc0731ab799
# ╟─8713588e-c74e-495c-b638-b4052d8455cb
# ╟─dd09f1a7-c6f5-4551-8eab-6a754f676865
# ╟─1833576b-1260-4d1e-bb48-74a7073d9bd9
# ╟─5eb38f50-3516-402c-832b-18504e6c1afd
# ╟─0ba89253-686d-4018-af9e-6b34acf4d970
# ╟─9ea81116-3702-4f27-b651-95d74fdbb7de
# ╟─412d74b3-13a1-408f-abc5-f48244948ae0
# ╟─0a21d431-bf99-42fe-9b8c-73fbab04fc10
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
