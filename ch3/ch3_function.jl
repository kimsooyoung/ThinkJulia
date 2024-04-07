### A Pluto.jl notebook ###
# v0.19.40

using Markdown
using InteractiveUtils

# ╔═╡ 9af29c9c-f3d0-11ee-03d6-81566489a62c
md"""
# Sooyoung Kim's Think Julia 

![image](https://github.com/kimsooyoung/ThinkJulia/assets/12381733/260603e2-20ed-428e-b15b-0381f73fb46c)
"""

# ╔═╡ 16fc0b28-a071-44c5-811b-69b8918f7604
md"""
## Functions

프로그래밍에서 함수란 "특정한 작업을 위해 재활용할 수 있도록 구현한 코드 블록"을 의미합니다. 수학 시간에 배웠던 함수와 비슷하게 프로그래밍에서의 함수 또한 입력과 출력을 갖고 있습니다.

특정한 목적을 갖는 함수를 선언한 뒤, 원하는 시점에 맞추어 호출하는 식으로 사용합니다.
"""

# ╔═╡ 375e5baa-3089-41f7-b2b0-2b7a0a7838ee
md"""
#### 3.1 Built-in 함수들과 함수 호출
"""

# ╔═╡ 9a43f4c1-795a-49ba-9430-dc049037cfed
md"""
Julia를 설치함과 동시에, 추가 설치 없이 사용할 수 있는 Julia 함수들이 존재합니다. 대표적인 예로, 첫 시간 살펴보았던 `println`이 있지요. 

함수를 호출하는 방법은 함수 이름을 입력하고 소괄호`()`를 함께 사용하는 것입니다. 몇가지 built-in 함수의 예시들을 같이 살펴보겠습니다.
"""

# ╔═╡ 9dbf28d6-3613-4dfa-b346-f944927a1dc6
begin
	println("This is also a function.")
	@show parse(Int32, "32")
	@show trunc(Int64, -2.3)
	@show float(32)
	@show string(32)
end

# ╔═╡ c378447f-368d-423e-b7f2-d0df4873ea51
md"""
#### 3.2 Julia Math Functions
"""

# ╔═╡ 32667c6b-a2d6-4de5-a350-93a182b65cae
md"""
Julia는 Computational Science를 목적으로 만들어졌기 떄문에 거의 대부분의 수학 관련 함수들을 기본으로 제공합니다. 

삼각 함수(sin, cos, tan) / 지수 함수 (log, exp) 뿐만 아니라 일반적인 수학 함수 (min, max, round, sqrt)들을 모두 제공하고 있습니다.
"""

# ╔═╡ 7cf73935-bbfd-4611-8cdf-61627a9e5e60
begin
	# decibels
	signal_power, noise_power = 200, 10
	ratio = signal_power / noise_power
	@show 10 * log10(ratio)

	# height
	radians = 0.7
	@show sin(radians)

	# general mathmetics
	@show sqrt(2) / 2
	@show maximum(randn(3))
end

# ╔═╡ 09fa47ac-1bba-48f3-b324-5c1fbc496648
md"""
#### 3.3 Composition (함수의 합성)
"""

# ╔═╡ 82832f5d-ea6a-4205-9457-c40f7f4608d7
md"""
프로그래밍 언어에서 함수는 다른 함수와 합성하여 사용할 수 있습니다. 

아래의 코드와 같이 `log(x+1)`의 결과를 다시 `exp()`의 입력으로 사용할 수 있습니다.
"""

# ╔═╡ fd58f512-4ecc-4d8d-9c84-3038f81509bd
begin
	degrees = 36
	x = sin(degrees / 360 * 2 * π)
	@show x
	
	x = exp(log(x+1))
	@show x
end

# ╔═╡ 393e6031-3f21-496e-995d-a8156d3ac46a
md"""
#### 3.4 새로운 함수 만들기
"""

# ╔═╡ a9b65b2f-3aab-4350-8385-729112657427
md"""
백문이 불여일견, 일단 함수를 어떻게 만드는지 코드부터 살펴봅시다.
"""

# ╔═╡ eebdda23-8bc3-4b30-adc0-9ed9f0a75b5d
function printlyrics()
    println("I'm a lumberjack, and I'm okay.")
    println("I sleep all night and I work all day.")
	return nothing
end

# ╔═╡ 4d691d03-0c1d-4313-ab91-fb8885ed55b8
md"""
1. 함수는 function이라는 키워드로 시작해서 end라는 키워드로 마무리됩니다. 만약 function과 end 사이는 모두 새로운 함수에 해당하는 영역이 됩니다.

2. function 키워드 다음으로 등장하는 것 코드가 함수의 이름이 되며, 이후 괄호를 반드시 붙입니다. 괄호 안에는 함수의 입력을 작성하고, 빈 괄호는 입력이 없다는 것을 의미합니다.

3. 일반적으로 가독성을 위해 함수는 들여쓰기 (space 2번,4번 혹은 TAB) 합니다.

4. 함수의 결과로 반환하는 값은 return 키워드 뒤에 써주면 됩니다. 위 코드에서 nothing은 Julia의 예약어로 아무것도 반환하지 않는다는 뜻입니다.
"""

# ╔═╡ 9e5cfec0-9f0d-4f77-b9d1-3c8e81950ba3
md"""
!!! notes
	함수는 **함수 이름 + 괄호()**를 사용함으로 호출할 수 있습니다. 아래의 실행 결과를 보면 println 두번이 실행된 것을 알 수 있습니다.

	함수 이름만 입력하는 것이 아닌 괄호를 같이 사용해야 함에 유의합니다!
"""

# ╔═╡ cfe4fb0b-c9e9-4cff-b8b2-57c9cab8627f
printlyrics

# ╔═╡ f0901cce-2517-451e-87bf-7a684cf4366f
printlyrics()

# ╔═╡ a587a3bc-70f1-42bd-ad6d-c31caf12df65
md"""
일전, 함수를 합성하여 사용할 수 있다고 했지요? 

함수 printlyrics를 사용하는 함수, repeatlyrics를 만들어 보고, 실행해 보겠습니다.
"""

# ╔═╡ ccf66fd8-0172-4684-8f0b-c30b57685844
function repeatlyrics()
    printlyrics()
    printlyrics()
end

# ╔═╡ d45989a9-6ae4-46c9-95cb-3a69904ded88
repeatlyrics()

# ╔═╡ ade94dca-28a9-44e4-b145-5d5679b4610f
md"""
### 연습 3-1
---
아래의 질문들에 답해 보세요
1. 함수 repeatlyrics가 정의되지 않은 상태에서 코드 repeatlyrics()를 입력하면 어떻게 될까요?
2. 함수 repeatlyrics는 다른 함수를 참고하는 합성 함수였습니다. 이러한 합성 함수를 사용하기 위해 어떠한 조건들이 필요한지 생각해보세요.
"""

# ╔═╡ b64f560b-1464-4a09-a143-ddd2d7dbf848
md"""
#### 3.5 매개변수와 인수
"""

# ╔═╡ 54efd808-ea76-4682-b378-1279d9dfd190
md"""
앞선 함수 `repeatlyrics`, `printlyrics`는 모두 함수 선언 시 입력받는 값이 없었습니다. 

이번에는 함수의 입력 즉, 매개변수를 가진 함수를 만들어보고 적절한 값, 인수를 전달해보겠습니다.
"""

# ╔═╡ 5911e123-0991-4674-af6d-64ddc987781c
function printtwice(bruce)
    println(bruce)
    println(bruce)
end

# ╔═╡ 75089437-f7e5-41ba-91d5-304b17dd10b7
md"""
위 함수는 bruce라는 매개변수를 가진 함수입니다. 이러한 형태의 함수를 사용하기 위해선, 반.드.시. 함수 사용 시 적합한 인수를 함께 전달해 주어야 합니다.
"""

# ╔═╡ 68c0afe7-30d2-4a59-bbe3-04650713a6af
begin
	# printtwice() # => ERROR
	printtwice("Julia is love.")
end

# ╔═╡ e325364f-e05a-4b4d-9dde-ba6653307d07
md"""
현재 인수로 전달할 수 있는 값은 println이 허용하는 모든 형태가 가능합니다.
"""

# ╔═╡ 1ebe5acc-9583-4d0b-90b8-dcdd42983b17
begin
	printtwice(99)
	printtwice(3.14)
	printtwice("김수영 "^3)
	printtwice(cos(1.5707))

	a = 1234
	printtwice(a)
end

# ╔═╡ c37c647e-ac3d-4ed4-aa52-6c992d08e392
md"""
!!! notes
	함수 선언 시 사용되는 매개변수의 이름은 실제 함수 사용 시 전달되는 변수 이름과 전혀 관계가 없습니다. 하지만 함수 내에서 해당 매개변수를 사용할 시 처음 설정한 이름만 사용할 수 있습니다. 예시를 살펴봅시다.
	```julia
	function printtwice(kim)
	    # 매개변수 이름이 kim으로 변경되었기 때문에 기존 bruce들을 모두 수정해야 합니다.
		println(kim)
	    println(kim)
	end

	park = 123
	# 호출 시 사용되는 인수 이름은 무관합니다.
	printtwice(park)
	```
"""

# ╔═╡ 8a6ebb21-576d-4f2a-bfba-e547555a2506
md"""
#### 3.6 함수 변수와 매개변수의 지역성
"""

# ╔═╡ b19a2b60-bf84-4404-8d3b-29c433c986d1
md"""
함수 안에서 새롭게 생성한 변수는 함수가 종료됨과 동시에 사라집니다. 예시를 살펴봅시다.
"""

# ╔═╡ 4b2fbfa9-71ba-4b2a-a90e-5aafeb728f1b
function cattwice(part1, part2)
    concat = part1 * part2
    printtwice(concat)
end

# ╔═╡ b8c9e0af-cd00-4ee1-ba40-b237552326e6
begin
	line1 = "Bing tiddle "
	line2 = "tiddle bang."
	cattwice(line1, line2)
end

# ╔═╡ 7fdb9303-144a-44c5-9742-4030ffc790a7
md"""
함수 cattwice가 성공적으로 종료된 상황에서, 함수 안에서 사용되었던 변수 concat을 사용하려고 하면 오류가 발생합니다. 

concat은 함수의 영역 안에서만 존재하기 때문입니다. 이를 지역성, locality라고 부릅니다.
"""

# ╔═╡ 8776c82d-02d2-44c9-ab38-bc8f7029dca5
@show concat

# ╔═╡ 85e7ee09-ef17-45e3-bb6b-9311c1f63481
md"""
#### 3.7 유익 함수와 void 함수 
"""

# ╔═╡ ed4177b7-31c0-40fa-a391-123031bbcf3f
md"""
이번 시간 처음으로 작성해보았던 함수 `printlyrics`를 살펴보면 함수의 return이 nothing입니다. 상황에 따라 이렇게 반환하는 값이 없는 함수를 작성하기도 하며, 이러한 함수는 **void 함수**라고 이야기합니다. 

"아무것도 아니다"라는 것을 Julia에서는 nothing이라는 키워드로 표현합니다. (Python의 None, C++의 NULL과 유사합니다.) - 이 값은 문자열 "nothing"과는 무관함에 유의합니다. 

반면, 무언가를 return하는 함수는 **유익 함수(fruitful function)**이라고 부릅니다. 

```julia
function printlyrics()
    println("I'm a lumberjack, and I'm okay.")
    println("I sleep all night and I work all day.")
	return nothing
end
```
"""

# ╔═╡ 4bb9b969-cbca-46dd-8c3f-7107e351cdce
begin
	@show typeof(nothing)
	@show nothing
end

# ╔═╡ ba3d0d64-8cea-428f-ba4c-ac62cdaa0424
md"""
!!! notes
	**함수를 사용하는 이유는 무엇일까요?**

	* 새로운 함수를 만드는 것은 일련의 문장들에 이름을 붙일 수 있는 기회를 제공하여 프로그램을 읽기 쉽고 디버깅(오류를 추적)하기 쉽게 만듭니다.
	* 함수를 사용하면 반복적인 코드를 제거하여 프로그램을 더 작게 만들 수 있습니다. 나중에 변경을 하려면 한 곳에서만 변경하면 됩니다.
	* 긴 프로그램을 함수로 나누면 각각의 부분을 디버깅하고 나서 작동하는 전체로 조립할 수 있습니다.
	* 잘 설계된 함수는 종종 많은 프로그램에 유용합니다. 한 번 작성하고 디버깅한 후에는 재사용할 수 있습니다.
	* Julia에서 함수는 성능을 많이 향상시킬 수 있습니다.
"""

# ╔═╡ e697ef7e-8d51-43f6-a5f5-46a1daff68e6
md"""
!!! warning
	여기 나오는 연습들은 지금까지 소개된 문장과 기능만을 써서 수행해야 합니다.
"""

# ╔═╡ 05aa65f1-527b-4683-8077-25cf039ca256
md"""
### 연습 3-2
---
rightjustify라는 함수를 작성해보세요. 문자열 변수 s를 매개변수로 받고, 그 문자열을 화면에 출력하되, 마지막 글자가 화면의 70번째 컬럼에 위치하도록 앞에 빈칸을 붙여서 출력하는 함수입니다.

```
julia> rightjustify("monty")
                                                                     monty
```
"""

# ╔═╡ 4083437f-46a7-4f4f-8d1b-b9149801ede1
md"""
!!! hint
	1회 문자열 결합과 반복을 사용하세요. 줄리아는 문자열의 길이를 알려주는 `length`라는 함수를 제공합니다. `length("monty")`는 5가 나오죠.
"""

# ╔═╡ ceb8ce1d-d845-4f6c-88d4-77a1552f5278
md"""
### 연습 3-3
---
함수 객체는 변수에 할당하거나 인수로 사용할 수 있는 값입니다. 예를 들어 다음 `dottwice`함수는 함수 객체를 인수로 받아서, 그것을 두 번 호출합니다.

```julia
function dotwice(f)
	f()
	f()
end
```

여기 dotwice 함수를 사용해서 printspam 함수를 두 번 호출하는 예시가 있습니다.

```julia
function printspam()
	println("spam")
end

dotwice(printspam)
```
"""

# ╔═╡ 0ed18d07-9166-4535-910b-1b8a6b920327
md"""
> 1. 여기 나온 예시를 타이핑해서 스크립트를 만든 후, 시험해보세요.
> 2. `dotwice` 함수를 두 개의 인수를 받도록 수정해보세요. 함수 객체와 값을 받아서, 함수를 두 번 호출하되, 전달받은 값을 인수로 사용하도록 해야 합니다.
> 3. 이 장의 앞부분에 나왔던, `printtwice` 함수를 스크립트에 복사해서 추가해보세요.
> 4. 앞에서 수정한 `dotwice` 함수를 이용해서, `printtwice` 함수를 두 번 호출해보세요. 인수로는 **"spam"**을 사용하고요.
> 5. `dofour`라는 함수를 만들어보세요. 함수 객체와 값을 인수로 받아서, 함수를 네 번 호출 하되, 전달받은 값을 인수로 사용하는 함수입니다. 단, 이 함수의 본문에는 문장이 네 개 가 아닌 두 개만 있어야 합니다.
"""

# ╔═╡ 35d36bb2-ae2a-4006-99cf-99d64957ed63
md"""
### 연습 3-4
---
1. `printgrid`라는 함수를 만들어보세요. 다음과 같은 격자를 출력해야 합니다.

```bash
julia> printgrid()
+ - - - - + - - - - +
|         |         |
|         |         |
|         |         |
|         |         |
+ - - - - + - - - - +
|         |         |
|         |         |
|         |         |
|         |         |
+ - - - - + - - - - +
```
"""

# ╔═╡ 98216eda-c868-414e-98b7-adf23f0bb028
md"""
2. 이와 비슷하게, 네 개의 줄과 네 개의 열을 그리는 함수를 작성해보세요.

!!! notes
	한 줄에 한 개 이상의 값을 출력하려면, 쉼표로 구분해서 전달합니다.
	```julia
	println("+", "-")
	```
"""

# ╔═╡ c3c8d225-cd0e-4efb-a40f-8833fc80a207
md"""
!!! notes
	print 함수는 출력 후 다음 줄로 넘어가지 않습니다.
	```julia
	print("+")
	println("-")
	```
	위 코드를 실행하면 같은 줄에 "+"라고 찍힙니다. 다음에 실행되는 출력문은 새로운 줄에서 시작하겠지요.
"""

# ╔═╡ Cell order:
# ╟─9af29c9c-f3d0-11ee-03d6-81566489a62c
# ╟─16fc0b28-a071-44c5-811b-69b8918f7604
# ╟─375e5baa-3089-41f7-b2b0-2b7a0a7838ee
# ╟─9a43f4c1-795a-49ba-9430-dc049037cfed
# ╠═9dbf28d6-3613-4dfa-b346-f944927a1dc6
# ╟─c378447f-368d-423e-b7f2-d0df4873ea51
# ╟─32667c6b-a2d6-4de5-a350-93a182b65cae
# ╠═7cf73935-bbfd-4611-8cdf-61627a9e5e60
# ╟─09fa47ac-1bba-48f3-b324-5c1fbc496648
# ╟─82832f5d-ea6a-4205-9457-c40f7f4608d7
# ╠═fd58f512-4ecc-4d8d-9c84-3038f81509bd
# ╟─393e6031-3f21-496e-995d-a8156d3ac46a
# ╟─a9b65b2f-3aab-4350-8385-729112657427
# ╠═eebdda23-8bc3-4b30-adc0-9ed9f0a75b5d
# ╟─4d691d03-0c1d-4313-ab91-fb8885ed55b8
# ╟─9e5cfec0-9f0d-4f77-b9d1-3c8e81950ba3
# ╠═cfe4fb0b-c9e9-4cff-b8b2-57c9cab8627f
# ╠═f0901cce-2517-451e-87bf-7a684cf4366f
# ╟─a587a3bc-70f1-42bd-ad6d-c31caf12df65
# ╠═ccf66fd8-0172-4684-8f0b-c30b57685844
# ╠═d45989a9-6ae4-46c9-95cb-3a69904ded88
# ╟─ade94dca-28a9-44e4-b145-5d5679b4610f
# ╟─b64f560b-1464-4a09-a143-ddd2d7dbf848
# ╟─54efd808-ea76-4682-b378-1279d9dfd190
# ╠═5911e123-0991-4674-af6d-64ddc987781c
# ╟─75089437-f7e5-41ba-91d5-304b17dd10b7
# ╠═68c0afe7-30d2-4a59-bbe3-04650713a6af
# ╟─e325364f-e05a-4b4d-9dde-ba6653307d07
# ╠═1ebe5acc-9583-4d0b-90b8-dcdd42983b17
# ╟─c37c647e-ac3d-4ed4-aa52-6c992d08e392
# ╟─8a6ebb21-576d-4f2a-bfba-e547555a2506
# ╟─b19a2b60-bf84-4404-8d3b-29c433c986d1
# ╠═4b2fbfa9-71ba-4b2a-a90e-5aafeb728f1b
# ╠═b8c9e0af-cd00-4ee1-ba40-b237552326e6
# ╟─7fdb9303-144a-44c5-9742-4030ffc790a7
# ╠═8776c82d-02d2-44c9-ab38-bc8f7029dca5
# ╟─85e7ee09-ef17-45e3-bb6b-9311c1f63481
# ╟─ed4177b7-31c0-40fa-a391-123031bbcf3f
# ╠═4bb9b969-cbca-46dd-8c3f-7107e351cdce
# ╟─ba3d0d64-8cea-428f-ba4c-ac62cdaa0424
# ╟─e697ef7e-8d51-43f6-a5f5-46a1daff68e6
# ╟─05aa65f1-527b-4683-8077-25cf039ca256
# ╟─4083437f-46a7-4f4f-8d1b-b9149801ede1
# ╟─ceb8ce1d-d845-4f6c-88d4-77a1552f5278
# ╟─0ed18d07-9166-4535-910b-1b8a6b920327
# ╟─35d36bb2-ae2a-4006-99cf-99d64957ed63
# ╟─98216eda-c868-414e-98b7-adf23f0bb028
# ╟─c3c8d225-cd0e-4efb-a40f-8833fc80a207
