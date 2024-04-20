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
# ╠═992b41c7-f6eb-42db-9490-b73fe4e4159d
# ╠═2891b353-942b-4f98-916a-4054ea4fdac0
