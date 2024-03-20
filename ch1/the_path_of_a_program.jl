### A Pluto.jl notebook ###
# v0.19.40

using Markdown
using InteractiveUtils

# ╔═╡ feeb05b1-bd32-4ee3-bd7a-dfcf2bf7a58b
using Printf

# ╔═╡ 8d289470-e5f1-11ee-18bc-01c50524e311
md"""
# Sooyoung Kim's Think Julia 

![image](https://github.com/kimsooyoung/ThinkJulia/assets/12381733/260603e2-20ed-428e-b15b-0381f73fb46c)
"""

# ╔═╡ 6f3b3779-7be1-44b1-93b8-0912ee602fc4
md"""
## The Path of a Program 

첫번째 Julia 프로그램을 실행해보고, Julia만의 여러 특성들에 대해서도 알아봅시다.
"""

# ╔═╡ 9a1f17a3-93b5-4ffc-9e97-0bb86705e9c9
md"""
#### 1.1 출력문

julia에서 콘솔 출력은 `print()`을 사용합니다. 모든 프로그래밍 언어에서 가장 처음 실행해보는 [Hello World](https://en.wikipedia.org/wiki/%22Hello,_World!%22_program) 부터 한 번 살펴볼까요?
"""

# ╔═╡ 78c6f23d-48e6-486a-a62a-9debc78c92fc
print("Hello World")

# ╔═╡ e7a96cc2-fb4b-4852-9588-dec70f164928
md"""
New Line을 포함하는 출력은 다음과 같습니다.
"""

# ╔═╡ 1263d38a-a066-46b8-94a4-33aeaa78cdac
println("Hello World")

# ╔═╡ 25c464ba-e38b-4d51-90aa-643adaecc612
md"""
print()를 사용하는 가장 기본적인 경우는 문자열 타입을 가진 변수, 혹은 리터럴을 출력하는 것입니다.
"""

# ╔═╡ b9193a58-b0fd-401a-9b53-22d87fdd52d0
let
	my_str = "Hello World"
	print(my_str)
end

# ╔═╡ 37f3fdf6-67a2-4efc-9885-2d612db73858
md"""
만약 문자열과, 문자열이 아닌 변수를 포함하여 출력문을 구성하고 싶다면 `$()`안에 변수를 넣어주면 됩니다.
"""

# ╔═╡ bbf34749-d02b-43c9-aea6-b6b317d07e20
let
	my_age = 27
	print("My age is $(my_age)")
end

# ╔═╡ 88fb9bd8-4472-4580-8609-53eb5c3c2bb8
md"""
`print()`와는 다른 속성을 갖지만, Julia 개발자들은 `@show` 메크로 함수도 자주 사용하고 있습니다. `@show`는 모든 타입의 변수들에 사용 가능합니다.
"""

# ╔═╡ 0a1010f1-758a-486f-badd-c37011353dc3
let
	my_age = 27
	@show my_age
end

# ╔═╡ 767235b4-afed-4d74-9416-6359aae4b99e
md"""
C 언어 스타일의 콘솔 출력을 지원하는 `Printf`라는 패키지가 있습니다. 간단히 리뷰하고 넘어가겠습니다.
"""

# ╔═╡ d6d86037-6438-4bec-aca1-d2629c4f1f1c
let
	my_age = 27
	@printf("pi = %0.20f \n", float(pi))
	@printf("My age is %d \n", my_age)
end

# ╔═╡ 3b0f9819-c692-4d5e-af00-1574ac68f085
md"""
#### 1.2 산술 연산자
"""

# ╔═╡ 2fb0d0e3-6267-45af-92db-e66164c7f540
md"""
Julia를 사용하는 기본적인 사칙연산을 살펴봅시다.
"""

# ╔═╡ 62e6555a-c905-4684-bd97-ddbf3fa1a562
begin
	@show 40 + 2
	@show 43 - 1
	@show 6 * 7
	@show 84 /2
end

# ╔═╡ c13810fd-05e8-4a02-97c3-f0ba5371dc09
md"""
다른 언어와 차이를 가지는 연산 기호로 `^(Circumflex)`가 있습니다. 이는 C 계열 언어에서 비트 연산 XOR을 의미하지만 Julia에서는 거듭제곱을 의미합니다.
"""

# ╔═╡ 3fb1baf4-7d25-4140-a6a0-ee818636a63c
begin
	@show 6^2 + 6
end

# ╔═╡ e196b619-2e4c-47c0-8452-3fbfe66708d0
md"""
#### 1.3 값과 자료형
"""

# ╔═╡ e9600d08-828e-4177-8a99-b2285f0b1b7d
md"""
Julia에서 변수의 자료형을 확인하고자 할 시 `typeof()` 함수를 사용합니다.
"""

# ╔═╡ c6a3bf0a-d0d0-4ae7-af2f-c6abf1ce2196
begin
	@show typeof(2)
	@show typeof(42.0)
	@show typeof("Hello World")
end

# ╔═╡ 9d5e7241-1b5d-4780-b6e8-35d4848394f1
md"""
Julia에서 자주 사용하는 또다른 자료형으로 `Vector`, `NamedTuple`이 있습니다. Vector를 사용할 시 쉼표의 유무에 주의해야 합니다. 쉼표가 없으면 `Matrix` 변수가 선언되기 떄문입니다.
"""

# ╔═╡ d62fe4b6-f911-467b-bd7d-2b8536001c60
begin
	@show typeof([1, 2, 3])
	@show typeof([1 2 3])
	@show typeof( (a = 1, b = 2, c = 4, d = 5) )
end

# ╔═╡ 31c458da-a7ae-4599-8854-2e30573a30ae
md"""
!!! warning
	예를 들면, 아래와 같은 실수가 있을 수 있지요
	```
	f_x = [1+1, 2+2, 3 +3]
	>>> syntax: missing separator in array expression
	```
	이는 `3 +3`이 `[3 +3]` Matrix로 인식되었기 때문입니다. 항상 띄어쓰기에 주의하세요 :) 
"""

# ╔═╡ 58a5358e-1219-4f4c-8bf8-0f9388d9d394
md"""
마지막으로, Julia에서 큰 수를 다룰 때는 `_(underscore)`를 중간에 삽입하여 혼란을 방지할 수 있습니다. 아래의 예시를 확인해보세요.
"""

# ╔═╡ a592ac1a-eab2-4974-ae4c-6bc11ab9dcfc
begin
	my_num = 1,000,000
	@show typeof(my_num)
	my_num = 1_000_000
	@show typeof(my_num)
end

# ╔═╡ 835f1d67-cfa6-4324-9091-4ca7aea54127
md"""
### 연습 1-1
---
1. 출력문에서 괄호를 하나 빠뜨리거나, 둘 다 빠뜨리면 어떻게 됩니까?
2. 문자열을 출력하려고 하는데, 따옴표를 하나 빠뜨리거나, 둘 다 빠뜨리면 어떻게 됩니까? 
3. `-2`처럼 음수를 표현할 때 뺄셈 기호를 쓸 수 있습니다. 만약에 덧셈 기호를 숫자 앞에 놓으면 어떻게 되나요? `2++2`를 입력하면 어떻게 될까요?
4. 수학에서 `02`처럼 숫자 앞에 있는 `0`은 문제가 아닙니다. 줄리아에서도 그럴까요?
5. 중간에 연산자 없이 두 값을 입력하면 어떻게 됩니까?

### 연습 1-2 
---
> (줄리아 REPL을 실행해서 계산기로 써봅시다.)
1. 42분 42초는 몇 초입니까?
2. 10킬로미터는 몇 마일입니까? 참고로 1마일은 1.61킬로미터입니다.
3. 10킬로미터 단축마라톤을 달리는 데 37분 48초 걸렸다면, 어느 정도 페이스로 달렸는지 계산해봅시다. 1마일당 소요 시간은 몇 분 몇 초인가요? 평균 속력은 시간당 마일로 어떻게 되나요?
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Printf = "de0858da-6303-5e67-8744-51eddeeeb8d7"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
"""

# ╔═╡ Cell order:
# ╟─8d289470-e5f1-11ee-18bc-01c50524e311
# ╟─6f3b3779-7be1-44b1-93b8-0912ee602fc4
# ╟─9a1f17a3-93b5-4ffc-9e97-0bb86705e9c9
# ╠═78c6f23d-48e6-486a-a62a-9debc78c92fc
# ╟─e7a96cc2-fb4b-4852-9588-dec70f164928
# ╠═1263d38a-a066-46b8-94a4-33aeaa78cdac
# ╟─25c464ba-e38b-4d51-90aa-643adaecc612
# ╠═b9193a58-b0fd-401a-9b53-22d87fdd52d0
# ╟─37f3fdf6-67a2-4efc-9885-2d612db73858
# ╠═bbf34749-d02b-43c9-aea6-b6b317d07e20
# ╟─88fb9bd8-4472-4580-8609-53eb5c3c2bb8
# ╠═0a1010f1-758a-486f-badd-c37011353dc3
# ╟─767235b4-afed-4d74-9416-6359aae4b99e
# ╠═feeb05b1-bd32-4ee3-bd7a-dfcf2bf7a58b
# ╠═d6d86037-6438-4bec-aca1-d2629c4f1f1c
# ╟─3b0f9819-c692-4d5e-af00-1574ac68f085
# ╟─2fb0d0e3-6267-45af-92db-e66164c7f540
# ╠═62e6555a-c905-4684-bd97-ddbf3fa1a562
# ╟─c13810fd-05e8-4a02-97c3-f0ba5371dc09
# ╠═3fb1baf4-7d25-4140-a6a0-ee818636a63c
# ╟─e196b619-2e4c-47c0-8452-3fbfe66708d0
# ╟─e9600d08-828e-4177-8a99-b2285f0b1b7d
# ╠═c6a3bf0a-d0d0-4ae7-af2f-c6abf1ce2196
# ╟─9d5e7241-1b5d-4780-b6e8-35d4848394f1
# ╠═d62fe4b6-f911-467b-bd7d-2b8536001c60
# ╟─31c458da-a7ae-4599-8854-2e30573a30ae
# ╟─58a5358e-1219-4f4c-8bf8-0f9388d9d394
# ╠═a592ac1a-eab2-4974-ae4c-6bc11ab9dcfc
# ╟─835f1d67-cfa6-4324-9091-4ca7aea54127
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
