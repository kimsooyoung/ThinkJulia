### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ b3edf2a0-ff26-11ee-1f0a-cdde4ef4dcf4
md"""
# Sooyoung Kim's Think Julia 

![image](https://github.com/kimsooyoung/ThinkJulia/assets/12381733/260603e2-20ed-428e-b15b-0381f73fb46c)
"""

# ╔═╡ 206002ef-ea26-4218-8243-cfb97da23b81
md"""
## Strings (문자열)

이번 시간부터 Julia에서 자주 사용되는 자료형들을 배워볼 것입니다. 그 첫번째 순서로 문자열이란, 문자들을 여러개 묶어놓은 자료형입니다. 

"Hello World", "My age is 28"와 같이 영어와 숫자를 사용할 수도 있으며, "안녕하세요", "🍌🍐🍎🍇"와 같이 한글이나 이모지를 결합하여 구성할 수도 있습니다. 이러한 경우 문자열을 다룰 시 주의가 요구됩니다.

사용자와 상호작용을 갖는 프로그램을 작성하게 된다면 그 나라의 말로 localizing 개발이 필요할 것입니다. 여러분이 이 역할을 담당하는 개발자가 되었다고 상상하면서 이번 챕터를 따라와주세요!
"""

# ╔═╡ b8003239-4c36-430e-8b0d-984aa349873b
md"""
#### 8.1 Characters (문자)
"""

# ╔═╡ a2232f5a-88a2-488a-ba49-5652d8796423
md"""
하나의 문자를 표현하는 자료형은 Char입니다. Char를 표현할 때는 혼란을 방지하기 위해 작은 따옴표 (')를 사용합니다.

자료형을 조회하는 내장 함수 typeof를 사용하여 몇가지 예시를 살펴봅시다.
"""

# ╔═╡ a2907284-6f33-4667-8060-e075b29392e6
begin 
	a = 'a'
	b = 'b'
	banana = '🍌'
	korean = 'ㄱ'

	@show typeof(a)
	@show typeof(b)
	@show typeof(banana)
	@show typeof(korean)
end

# ╔═╡ 7e1a2cd4-ae7d-4886-82ae-68ddade37e46
md"""
위 예시와 같이 영어와 숫자 이외에도 이모지나 한글도 하나의 문자 자료형으로 인식됩니다.

다만, 영어와 숫자의 경우 **미국정보교환표준부호(ASCII)**로 지정되어 있어 0부터 127까지의 고유 번호를 갖고 있습니다.

전세계의 언어 기호와 이모지 같이 더 많은 문자의 표현이 요구됨에 따라 **유니코드 표준**이라는 것이 만들어졌고 전세계 모든 문자와 이모지와 각종 기호들에 고유 번호가 붙어있습니다.
"""

# ╔═╡ 2f321e0c-851d-4880-96e3-a36535510c0c
md"""
#### 8.2 문자열은 문자의 순열 
"""

# ╔═╡ c00c1bfa-a388-4731-83c5-1b948cf6b638
begin
	my_str = "swimming kim"
	@show my_str[1]
	@show my_str[2]
	@show my_str[3]
	@show my_str[4]
	@show my_str[5]
	@show my_str[6]
	@show my_str[7]
	@show my_str[8]
	@show my_str[9]
	@show my_str[10]
	@show my_str[11]
	@show my_str[12]
end

# ╔═╡ af6bc925-14d6-4d7b-adc1-a490fd2a82e3
md"""
위 코드에서 확인할 수 있듯이, 문자열은 Char 타입의 문자들이 결합되어 있는 자료형입니다. 그렇기 때문에 문자열 내의 각 문자 자료에 접근하여 값을 가져오거나, 수정할 수 있습니다. 

문자열 내 어디에 위치하고 있는 문자를 가져올 것인지 정보가 필요하고 **앞에서부터 몇번째**라는 숫자, **인덱스**를 사용합니다.

!!! notes
	Julia에서 인덱스는 1부터 시작합니다! 
	Python, C/C++, Java 등 대부분의 프로그래밍 언어들은 0부터 시작하지요.
"""

# ╔═╡ 1fd100d8-4949-4ccc-9eda-170e7b25dd5a
md"""
가장 끝의 문자에 접근하고 싶은 경우, Julia에서는 **end**라는 인덱스 키워드를 제공하고 있습니다. 
"""

# ╔═╡ 9d2ffbec-e1d7-4129-9758-a257f8839dc6
begin
	@show my_str[end]
end

# ╔═╡ 965154ee-2895-45d4-98fb-9a9c1e12ade5
md"""
인덱스로 표현식을 사용하거나 변수를 사용할 수도 있습니다. 하지만 인덱스는 반드시 정수여야 하며, 양수여야 합니다. 
"""

# ╔═╡ 6f4cd3dc-e5c6-412a-b7a7-c59bbe0e15d7
begin
	i = 3
	@show my_str[3+4]
	@show my_str[i]
	@show my_str[end]
end

# ╔═╡ 6224b384-4dba-4d7c-90c7-af4814b8131d
md"""
#### 8.3 length 
"""

# ╔═╡ 26804165-acae-4360-b681-32afc55eac2c
md"""
문자열 내 총 문자의 개수를 반환하는 length입니다.
"""

# ╔═╡ 21dc633b-91c4-4a45-9eaa-27e7388dfdaa
begin
	fruits = "🍌 🍎 🍐"
	len = length(fruits)
	@show len
end

# ╔═╡ aa545cf6-55a4-4a7a-b8b4-0122932b60ed
md"""
!!! warning
	문자열의 가장 마지막 문자를 조회할 시 아래와 같이 코드를 작성하면 될 것 같지만, 유니코드와 아스키 코드가 섞인 문자열의 경우 이는 제대로 동작하지 않습니다.
"""

# ╔═╡ 30439c6c-e24c-4d5b-a39a-43e860870a6c
begin
	ascii_str = "This only contains ASCII"
	@show ascii_str[length(ascii_str)]

	unicode_str = "사과는 나의 최애 🍎"
	@show unicode_str[length(unicode_str)]
end

# ╔═╡ cf94c77c-1350-4e3e-9afc-5bfe768255b5
md"""
이는 아스키 코드 문자와 유니코드 문자가 차지하는 메모리 크기가 다르기 떄문입니다. 

떄문에 인덱스 사용 시 유니코드를 고려하여 다음 문자의 인덱스를 조회하는 별도의 함수를 사용해야 합니다.
"""

# ╔═╡ 882d3eac-b811-4187-aaa8-b5061cc2aa2c
begin
	index = 1
	for i in 1:11
		@show unicode_str[index]
		index = nextind(unicode_str, index)
	end
end

# ╔═╡ a7e0c5b7-2d7e-4e79-b4ef-545a0dcbce01
md"""
#### 8.4 Traversal (순회) 
"""

# ╔═╡ 992b41c7-f6eb-42db-9490-b73fe4e4159d
md"""
문자열과 같은 배열 타입 데이터를 처음부터 끝까지 조회하는 것을 순회라고 부릅니다. 코드적으로 첫번째 요소의 인덱스부터 마지막 요소의 인덱스까지 반복하면서 작업을 하는 것이지요.

순회를 위해 while 또는 for loop이 많이 사용됩니다.
"""

# ╔═╡ 2891b353-942b-4f98-916a-4054ea4fdac0
let
	index = firstindex(unicode_str)
	
	while index <= sizeof(unicode_str)
	    letter = unicode_str[index]
	    println(letter)
	    index = nextind(unicode_str, index)
	end
end

# ╔═╡ 2aced71c-d1c4-49b3-a94f-df5af3b96601
md"""
위 코드에서 사용된 내장 함수들을 복기해보겠습니다.

* **firstindex(<string>)** : 문자열 첫번째 요소의 인덱스를 반환합니다. 
* **sizeof(<string>)** : 문자열 전체의 사이즈를 반환합니다. (이 사이즈는 내부 요소 개수의 수와 같을 수도 있고 다를 수도 있겠지요.) 
* **nextind(<string>, <cur-index>)** : 문자열과 현재 인덱스를 받아 문자열 내 다음 인덱스를 반환합니다. 
"""

# ╔═╡ cc2d2312-0d15-4aae-b7f5-157419f46b79
md"""
순회는 while 또는 for loop을 사용할 수 있다고 이야기하였습니다. 이번에는 for loop을 사용한 버전을 살펴보겠습니다.
"""

# ╔═╡ b49f7f4c-2e85-4b84-bb74-0b0a3055d6b1
for letter in unicode_str
	println(letter)
end

# ╔═╡ e3edd347-b0c3-424c-8292-070ab6b6c6f0
md"""
사실 for loop과 in 키워드를 함께 사용하면 nextind 사용 없이 간편하게 요소 순회가 가능합니다. 이는 이후 배우게 될 반복 자료형들에도 모두 적용되므로 잘 숙지해둡시다. 
"""

# ╔═╡ c19a5d71-438d-406a-984f-4481708b808b
md"""
### 연습 8-1
---
문자열을 인수로 받아 맨 뒤 글자부터 한 줄에 하나씩 출력하는 함수를 작성해보세요.
"""

# ╔═╡ 54abcb45-9d53-45ff-9f4c-d04f7f9cbe30
md"""
#### 8.5 String Slices (슬라이싱) 
"""

# ╔═╡ db75afc7-3c13-457b-9805-116ad5b47580
ppap = "penpineappleapplepen"

# ╔═╡ 468d9d45-8fb5-4c58-89ac-33ca59eb984f
md"""
위 문자열의 일부에 해당하는 "pineapple"을 추출하고 싶다고 합니다. 이렇게 문자열 내의 일부를 잘라오는 것을 **slicing**이라고 이야기하며 **string[n:m]**으로 구현합니다.
"""

# ╔═╡ 4eeb644c-a303-418a-85f2-47e8a97aa86a
ppap[4:4+8]

# ╔═╡ 1c31ad05-19b0-45a9-b5a8-f1751d466448
md"""
pineapple의 p는 4번째 인덱스부터 시작하고, pineapple 단어 자체가 8글자이므로 위와 같이 slicing을 할 수 있습니다.

!!! note
	엄연히 말해 string[n:m] 코드는 문자열 내의 n번째 byte 부터 m번째 byte까지를 의미합니다.
"""

# ╔═╡ a5b4983b-c1fa-456c-94c2-5d5d56427573
begin
	@show ppap[:]
	@show ppap[1:end]
	@show ppap[5:2]
	@show sizeof("")
end

# ╔═╡ 88fd3c15-c234-40e9-a742-741f6cd1acd4
md"""
위 코드들을 차례대로 설명하면 다음과 같습니다.
* slicing시 어떠한 숫자도 입력하지 않으면 전체 문자열 자체가 됩니다.
* end 키워드는 문자열의 맨 끝을 의미하므로 [n:end]와 같이 "n번째부터 마지막까지"라는 의미로 구현할 수도 있습니다. 
* slicing시 앞서는 숫자가 더 큰 경우 결과는 빈 문자열이 됩니다. (보통 이렇게 구현하지는 않을 것입니다.) 
* 여기서의 빈 문자열은 문자와는 달리 문자열 타입이되, 요소가 하나도 없는 경우를 뜻합니다. 그래서 size는 0이 됩니다.
"""

# ╔═╡ 35d8e3b3-5118-4d8b-9753-b8437dd9e5f0
md"""
#### 8.6 Immutable String (문자열의 불변) 
"""

# ╔═╡ d99cd16f-36a6-4ade-9da2-62799e07f8e9
mistaken_str = "Yello World!"

# ╔═╡ 909e358f-f488-47cb-9338-58231326d81e
md"""
잘못 입력된 문자열에서 특정 문자를 바꾸고 싶은 경우 
"""

# ╔═╡ 49cc2f0f-b3b9-4802-a2f1-bd429cacc9cc
mistaken_str[1] = 'H'

# ╔═╡ 29f54d76-8981-44e7-86f7-d9ad7d3dfc79
md"""
이렇게 indexing 형태로 바꾸고 싶지만 Julia에서 이를 허용하지 않아 에러가 발생합니다.

이는 Julia에서 문자열이 불변(Immutable)이기 때문인데요, 한 번 선언한 문자열은 값을 바꿀 수 없다는 뜻입니다.

따라서 위 문자열을 고치고 싶다면 아예 새로운 문자열을 만들어서 재할당해야 합니다.
"""

# ╔═╡ a6e1e6be-56b0-4c23-9916-1b9248a2cc79
begin
	modified_str = "H" * mistaken_str[2:end]
end

# ╔═╡ f4ca8317-bb26-4ba4-b251-be4dd16a637e
md"""
#### 8.7 String Interpolation (문자열의 보간) 
"""

# ╔═╡ f0917653-12e9-4fa8-909e-13cbda36982e
md"""
println을 통해 아래와 같은 디버깅 메세지를 출력하고 싶다고 해봅시다.
"""

# ╔═╡ c0b812ce-125a-4290-bd06-a7dd4e5ba189
let
	var_a = 3.14
	var_b = 2.71

	println("var a : ", var_a, " / var b : ", var_b)
end

# ╔═╡ 336db781-56bc-4404-920d-5f6746170139
md"""
지금은 변수가 두 개 뿐이어서 혼란스러울 일이 없지만, 변수가 매우 많아지는 경우 이들을 모두 println 포멧에 맞추기 위해 " var_n : ", " var_n+1 : "과 같이 계속 이어붙이는 것은 매우 귀찮은 일입니다.
"""

# ╔═╡ b73d4c28-23e9-4597-81d3-7ef7899ea8e2
let
	var_a = 3.14
	var_b = 2.71

	println("var a : $var_a / var b : $var_b")
end

# ╔═╡ 8e414dca-651b-44c7-a32f-ead29fe2e86a
md"""
이러한 경우 유용하게 사용할 수 있는 문법이 \$기호를 사용하는 String Interpolation입니다. \$ 기호 다음으로 변수명을 입력하면 해당 변수값을 가져오는 것처럼 포맷팅이 가능힙니다.  
"""

# ╔═╡ 8b560c72-cd52-4488-b5e8-07a52c2b0f30
md"""
#### 8.8 String Searching (문자열의 탐색) 
"""

# ╔═╡ 1ba99d26-ea8e-49cb-b72c-4eb0117e6ff4
function find(word, letter)
    index = firstindex(word)
    while index <= sizeof(word)
        if word[index] == letter
            return index
        end
        index = nextind(word, index)
    end
    -1
end

# ╔═╡ 58f3c8d1-5b2d-414c-be4c-c3857e943764
find("abcdefghijklmn", 'k')

# ╔═╡ 6a4c3993-8fc6-49fd-972d-e8f5e0ab8d5d
md"""
위 코드는 어떠한 의미를 갖고 있을까요?

input parameter인 **word**의 요소들 가운데, 두번째 문자인 letter가 존재하는지, 존재한다면 몇번째 인덱스를 갖는지 알려주는 함수가 됩니다.

여기서 존재하지 않는다면, -1을 리턴하게 되며 프로그래밍에서 -1이란 이처럼 원하는 결과가 없거나 오류가 발생한 상황이라는 의미를 갖고 있습니다.
"""

# ╔═╡ d18a66fa-73af-40ba-8060-c77a0d71c566
function counter(word, letter)
	count = 0
	for elem in word
	    if elem == letter
	        count = count + 1
	    end
	end
	return count
end

# ╔═╡ fd4142bb-dd2e-4522-ba31-531c4e4661c0
counter("banana", 'a')

# ╔═╡ fefa3149-c086-4856-97d3-7d553fe6fe2e
md"""
탐색의 또다른 예시를 가져와보았습니다. "banana"라는 문자열 안에 'a'는 총 몇개가 존재하는지 개수를 반환하는 함수이지요.

문자열의 탐색을 통해 구현할 수 있는 함수로 **find**와 **counter**까지 살펴보았습니다. 연습 문제 하나를 풀고 넘어가보겠습니다.
"""

# ╔═╡ 79cd8618-e519-4bee-af76-d0b9d1b35e42
md"""
### 연습 8-2
---
find 함수를 수정해서, 세 번째 인수를 받을 수 있도록 하세요. 이 인수는 탐색을 시작할 **word**의 인덱스를 지정합니다.

그런 다음 count 함수에서 for를 통한 순회 대신 find 함수를 사용하도록 구현해보세요.
"""

# ╔═╡ bea7187c-a0ce-4248-af30-60a4aec15cb0
md"""
#### 8.9 문자열 라이브러리 
"""

# ╔═╡ 7b69d574-7a16-4f6a-85d0-660f57fffe45
begin
	@show uppercase("pineapple")
	@show lowercase("South Korea")
	@show findfirst('K', "South Korea")
	@show findfirst("na", "banana")
	@show findnext("na", "banana", 4)
end

# ╔═╡ 94ea4a7a-19ab-429b-bfcd-3e6520374856
md"""
Julia는 문자열을 다루는 기본 내장 함수들을 갖고 있습니다. 상단의 예시를 하나씩 분석해보자면,

- **uppercase(<String>)** : 매개변수인 문자열을 모두 대문자로 바꿉니다. 
- **lowercase(<String>)** : 매개변수인 문자열을 모두 소문자로 바꿉니다.
- **findfirst(<Char/String>, <String>)** : 두번째 매개변수인 문자열 내에서 첫번째 매개변수인 문자열 혹은 문자의 인덱스를 반환합니다.
- **findnext(<Char/String>, <String>, <Index>)** : findfirst는 앞에서부터 검색하며 결과를 얻게 될 시 바로 반환을 하지만 상황에 따라 일치하는 가장 앞의 인덱스가 아닌 다른 경우를 원할 수도 있습니다. 이런 경우 findnext는 세번째 매개변수로 검색을 시작할 인덱스를 받아 여기서부터 탐색을 시작합니다.
"""

# ╔═╡ b6724e4f-b60f-438f-9fa0-72bd4a2a0ebb
md"""
#### 8.10 ∈ 연산자  
"""

# ╔═╡ 791110af-78c9-4b1b-8b72-93e104740c6f
md"""
수학시간 집합을 공부하면서 보셨을 것 같은데요. ∈(\in) 연산자는 왼쪽의 요소가 오른쪽의 집합에 포함되어 있다는 것을 의미합니다.

Julia에서는 포함관계에 대한 True/False 여부를 반환하는 관계 연산자로 사용되지요.
"""

# ╔═╡ 8e4eff4e-09a1-4d34-a972-03899884fead
'a' ∈ "banana" 

# ╔═╡ 82e09a1f-131a-48b9-88fc-c1905cb30e7e
md"""
∈ 연산자를 사용하여 두 문자열 안에 공통으로 존재하는 문자가 있는지 조회하는 함수, **inboth**를 구현해보았습니다.
"""

# ╔═╡ dd21e381-f3c2-4345-922a-7cb2ce8a5b23
 function inboth(word1, word2)
    for letter in word1
        if letter ∈ word2
            print(letter, " ")
        end
    end
end

# ╔═╡ b540bd3b-fc94-4019-8778-e4747cf081d8
inboth("apples", "oranges")

# ╔═╡ c9f4b6a3-f56f-419d-bfd0-b2348603ea2c
md"""
#### 8.11 문자열 비교  
"""

# ╔═╡ b8b0b96d-54c1-4672-b51d-c803919f4134
begin
	fruit_1 = "Pineapple"
	fruit_2 = "Banana"

	if fruit_1 < fruit_2
	    println("Your word, $fruit_1, comes before Banana.")
	elseif fruit_1 > fruit_2
	    println("Your word, $fruit_1, comes after Banana.")
	else
	    println("All right, Banana.")
	end
end

# ╔═╡ 446f4724-a2e7-4369-9534-b6723fb7e1e8
md"""
문자열은 상수가 아니지만 비교를 할 수 있습니다. 영어의 경우 알파벳 순서에 따라 앞선 글자는 더 작은 값을 갖게 되는 것이지요. 

Pineapple의 P가 Banana의 B보다 알파벳 순으로 더 뒤에 오기 때문에 위 코드에서 "Pineapple" > "Banana"가 됩니다
"""

# ╔═╡ 5b1829cc-38bb-4cb6-bd85-0eb3cd6333da
let
	fruit_1 = "Pineapple"
	fruit_2 = "banana"
	
	if fruit_1 < fruit_2
	    println("Your word, $fruit_1, comes before banana.")
	elseif fruit_1 > fruit_2
	    println("Your word, $fruit_1, comes after banana.")
	else
	    println("All right, banana.")
	end
end

# ╔═╡ b583dd1d-ece5-4ac5-bd6b-22b26382ade0
md"""
하지만 알파벳에서 모든 대문자는 소문자보다 ASCII 코드 상으로 앞서있습니다. 따라서 문자의 값 자체가 대문자 < 소문자가 되는 것이지요.  
"""

# ╔═╡ 1b871c8a-df94-4d40-b591-16b7c62c3d14
let
	fruit_1 = "파인애플"
	fruit_2 = "바나나"
	
	if fruit_1 < fruit_2
	    println("Your word, $fruit_1, comes before 바나나.")
	elseif fruit_1 > fruit_2
	    println("Your word, $fruit_1, comes after 바나나.")
	else
	    println("All right, 바나나.")
	end
end

# ╔═╡ 8a0582c8-f50e-4e7a-beb4-16eb56355bc8
md"""
한국어의 경우 ㄱ,ㄴ,ㄷ 순으로 번호를 부여받았기 때문에 ㅍ로 시작하는 파인애플의 값이 더 큽니다.
"""

# ╔═╡ 33067ab9-64d9-49ff-87f7-b5b25a53d71c
md"""
### 연습 8-3
---
아래 코드의 함수 **isreverse**는 두 문자열을 받아 두 문자열이 서로 뒤집어져 있는 관계인지 판별합니다. 예를 들어, $stop$을 뒤집으면 $pots$가 됩니다.

하지만, 이 코드에는 현재 오류가 있어 제대로 동작하지 못하고 있습니다. 이 오류를 정정하여 my_isreverse 함수를 구현해보세요.
"""

# ╔═╡ a2672327-a2d1-45e5-af54-d7f8fae3f739
function isreverse(word1, word2)
    if length(word1) != length(word2)
        return false
    end
    i = firstindex(word1)
    j = lastindex(word2)
    while j >= 0
        j = prevind(word2, j)
        if word1[i] != word2[j]
            return false
        end
        i = nextind(word1, i)
    end
    true
end

# ╔═╡ 7fc97970-c1c1-40c9-a943-4cc2ccb33b0a
isreverse("stop", "pots")

# ╔═╡ bda92e23-1cf0-46aa-a246-f53ac86f4ae9
md"""
### 연습 8-4
---
아래 코드의 함수 **isreverse**는 두 문자열을 받아 두 문자열이 서로 뒤집어져 있는 관계인지 판별합니다. 예를 들어, $stop$을 뒤집으면 $pots$가 됩니다.

하지만, 이 코드에는 현재 오류가 있어 제대로 동작하지 못하고 있습니다. 이 오류를 정정하여 **my_isreverse** 함수를 구현해보세요.
"""

# ╔═╡ 31ffbf8d-86b4-4287-9050-cbc6cee6e641
md"""
### 연습 8-5
---

문자열 조각을 만드는 연산에 세번째 인덱스를 넣을 수도 있습니다. 첫 번째는 시작 지점, 세 번째는 종료 지점, 두 번째는 간격입니다. 

두 번째, 간격이란 조각을 만들 글자와 글자 사이의 간격을 말합니다. 간격이 2라면, 한 글자씩 건너뛸 것이고, 3이라면 두 글자씩 건너뛸 것입니다. 다음 예를 보세요.


```julia
julia> fruit = "banana"
"banana"
julia> fruit[1:2:6]
"bnn"
```

간격이 -1이면 문자열을 역순으로 따라갑니다. 그러므로 **[end: -1:1]** slicing은 뒤집힌 문자열 을 만듭니다.

> 이 사용법을 활용하면, [연습 6-3]의 회문 여부를 판단하는 함수, **ispalindrome** 함수를 딱 한 줄로 만들 수 있습니다. 이를 다시 구현해보세요. (회문이란, noon, redivider 처럼 앞뒤를 바꾸어도 동일한 단어를 말했습니다.)
"""

# ╔═╡ ac97d9bd-cb8a-40c2-8d45-2f994f52d537
md"""
### 연습 8-6
---
**카이사르 암호(Caesar cipher)**는 각 문자를 고정된 자릿수만큼 '회전'하는 방식으로 동작하는 약한 암호화 방법입니다. 

문자를 회전한다는 것의 의미는 알파벳에서 정해진 횟수만큼 다음 글자로 움직인다는 뜻으로, 마지막 글자 Z 다음에는 다시 처음 글자 A로 이어집니다. 

예를 들어, A를 3만큼 회전하면 D가 되고, Z를 1만큼 회전하면 A가 됩니다.

단어를 회전하려면, 각 글자를 같은 만큼 회전하면 됩니다. $cheer$를 7만큼 회전 하면 $jolly$가 되고, $melon$을 -10만큼 회전하면 $cubed$가 됩니다. 

> 문자열과 정수를 인수로 받아서, 받은 문자열을 받은 인수만큼 회전해서 만든 문자열을 반환하는 함수 **rotateword**를 작성하세요.

!!! hint
	1 문자를 숫자 코드로 변환하는 Int 함수와 숫자 코드를 문자로 변환하는 Char 함수가 유용할 것입니다. 알파벳 글자들은 알파벳 순서대로 부호화되어 있습니다. 예를 들어, 'C'는 알파벳의 세 번째 문자이므로 다음과 같은 결과를 얻을 수 있습니다.
	```julia
	Int('c') - Int('a')
	> 2
	```
	주의할 점은 대문자와 소문자는 부호화된 숫자가 다르다는 것입니다.
	```julia
	Char(Int('A') + 32)
	> 'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
	```
"""

# ╔═╡ Cell order:
# ╟─b3edf2a0-ff26-11ee-1f0a-cdde4ef4dcf4
# ╟─206002ef-ea26-4218-8243-cfb97da23b81
# ╟─b8003239-4c36-430e-8b0d-984aa349873b
# ╟─a2232f5a-88a2-488a-ba49-5652d8796423
# ╠═a2907284-6f33-4667-8060-e075b29392e6
# ╟─7e1a2cd4-ae7d-4886-82ae-68ddade37e46
# ╟─2f321e0c-851d-4880-96e3-a36535510c0c
# ╠═c00c1bfa-a388-4731-83c5-1b948cf6b638
# ╟─af6bc925-14d6-4d7b-adc1-a490fd2a82e3
# ╟─1fd100d8-4949-4ccc-9eda-170e7b25dd5a
# ╠═9d2ffbec-e1d7-4129-9758-a257f8839dc6
# ╟─965154ee-2895-45d4-98fb-9a9c1e12ade5
# ╠═6f4cd3dc-e5c6-412a-b7a7-c59bbe0e15d7
# ╟─6224b384-4dba-4d7c-90c7-af4814b8131d
# ╟─26804165-acae-4360-b681-32afc55eac2c
# ╠═21dc633b-91c4-4a45-9eaa-27e7388dfdaa
# ╟─aa545cf6-55a4-4a7a-b8b4-0122932b60ed
# ╠═30439c6c-e24c-4d5b-a39a-43e860870a6c
# ╟─cf94c77c-1350-4e3e-9afc-5bfe768255b5
# ╠═882d3eac-b811-4187-aaa8-b5061cc2aa2c
# ╟─a7e0c5b7-2d7e-4e79-b4ef-545a0dcbce01
# ╟─992b41c7-f6eb-42db-9490-b73fe4e4159d
# ╠═2891b353-942b-4f98-916a-4054ea4fdac0
# ╟─2aced71c-d1c4-49b3-a94f-df5af3b96601
# ╟─cc2d2312-0d15-4aae-b7f5-157419f46b79
# ╠═b49f7f4c-2e85-4b84-bb74-0b0a3055d6b1
# ╟─e3edd347-b0c3-424c-8292-070ab6b6c6f0
# ╠═c19a5d71-438d-406a-984f-4481708b808b
# ╟─54abcb45-9d53-45ff-9f4c-d04f7f9cbe30
# ╠═db75afc7-3c13-457b-9805-116ad5b47580
# ╟─468d9d45-8fb5-4c58-89ac-33ca59eb984f
# ╠═4eeb644c-a303-418a-85f2-47e8a97aa86a
# ╟─1c31ad05-19b0-45a9-b5a8-f1751d466448
# ╠═a5b4983b-c1fa-456c-94c2-5d5d56427573
# ╟─88fd3c15-c234-40e9-a742-741f6cd1acd4
# ╟─35d8e3b3-5118-4d8b-9753-b8437dd9e5f0
# ╠═d99cd16f-36a6-4ade-9da2-62799e07f8e9
# ╟─909e358f-f488-47cb-9338-58231326d81e
# ╠═49cc2f0f-b3b9-4802-a2f1-bd429cacc9cc
# ╟─29f54d76-8981-44e7-86f7-d9ad7d3dfc79
# ╠═a6e1e6be-56b0-4c23-9916-1b9248a2cc79
# ╟─f4ca8317-bb26-4ba4-b251-be4dd16a637e
# ╟─f0917653-12e9-4fa8-909e-13cbda36982e
# ╠═c0b812ce-125a-4290-bd06-a7dd4e5ba189
# ╟─336db781-56bc-4404-920d-5f6746170139
# ╠═b73d4c28-23e9-4597-81d3-7ef7899ea8e2
# ╟─8e414dca-651b-44c7-a32f-ead29fe2e86a
# ╟─8b560c72-cd52-4488-b5e8-07a52c2b0f30
# ╠═1ba99d26-ea8e-49cb-b72c-4eb0117e6ff4
# ╠═58f3c8d1-5b2d-414c-be4c-c3857e943764
# ╟─6a4c3993-8fc6-49fd-972d-e8f5e0ab8d5d
# ╠═d18a66fa-73af-40ba-8060-c77a0d71c566
# ╠═fd4142bb-dd2e-4522-ba31-531c4e4661c0
# ╟─fefa3149-c086-4856-97d3-7d553fe6fe2e
# ╟─79cd8618-e519-4bee-af76-d0b9d1b35e42
# ╟─bea7187c-a0ce-4248-af30-60a4aec15cb0
# ╠═7b69d574-7a16-4f6a-85d0-660f57fffe45
# ╟─94ea4a7a-19ab-429b-bfcd-3e6520374856
# ╟─b6724e4f-b60f-438f-9fa0-72bd4a2a0ebb
# ╟─791110af-78c9-4b1b-8b72-93e104740c6f
# ╠═8e4eff4e-09a1-4d34-a972-03899884fead
# ╟─82e09a1f-131a-48b9-88fc-c1905cb30e7e
# ╠═dd21e381-f3c2-4345-922a-7cb2ce8a5b23
# ╠═b540bd3b-fc94-4019-8778-e4747cf081d8
# ╟─c9f4b6a3-f56f-419d-bfd0-b2348603ea2c
# ╠═b8b0b96d-54c1-4672-b51d-c803919f4134
# ╟─446f4724-a2e7-4369-9534-b6723fb7e1e8
# ╠═5b1829cc-38bb-4cb6-bd85-0eb3cd6333da
# ╟─b583dd1d-ece5-4ac5-bd6b-22b26382ade0
# ╠═1b871c8a-df94-4d40-b591-16b7c62c3d14
# ╟─8a0582c8-f50e-4e7a-beb4-16eb56355bc8
# ╟─33067ab9-64d9-49ff-87f7-b5b25a53d71c
# ╠═a2672327-a2d1-45e5-af54-d7f8fae3f739
# ╠═7fc97970-c1c1-40c9-a943-4cc2ccb33b0a
# ╟─bda92e23-1cf0-46aa-a246-f53ac86f4ae9
# ╟─31ffbf8d-86b4-4287-9050-cbc6cee6e641
# ╟─ac97d9bd-cb8a-40c2-8d45-2f994f52d537
