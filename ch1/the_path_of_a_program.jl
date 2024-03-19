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
"""

# ╔═╡ 78c6f23d-48e6-486a-a62a-9debc78c92fc
print("Hello World")

# ╔═╡ 1263d38a-a066-46b8-94a4-33aeaa78cdac
println("Hello World")

# ╔═╡ b9193a58-b0fd-401a-9b53-22d87fdd52d0
let
	my_str = "Hello World"
	print(my_str)
end

# ╔═╡ bbf34749-d02b-43c9-aea6-b6b317d07e20
let
	my_age = 27
	print("My age is $(my_age)")
end

# ╔═╡ 0a1010f1-758a-486f-badd-c37011353dc3
let
	my_age = 27
	@show my_age
end

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

# ╔═╡ 62e6555a-c905-4684-bd97-ddbf3fa1a562
begin
	@show 40 + 2
	@show 43 - 1
	@show 6 * 7
	@show 84 /2
end

# ╔═╡ 3fb1baf4-7d25-4140-a6a0-ee818636a63c
begin
	@show 6^2 + 6
end

# ╔═╡ e196b619-2e4c-47c0-8452-3fbfe66708d0
md"""
#### 1.3 값과 자료형
"""

# ╔═╡ c6a3bf0a-d0d0-4ae7-af2f-c6abf1ce2196
begin
	@show typeof(2)
	@show typeof(42.0)
	@show typeof("Hello World")
end

# ╔═╡ d62fe4b6-f911-467b-bd7d-2b8536001c60
begin
	@show typeof([1, 2, 3])
	@show typeof([1 2 3])
	@show typeof( (a = 1, b = 2, c = 4, d = 5) )
end

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
# ╠═9a1f17a3-93b5-4ffc-9e97-0bb86705e9c9
# ╠═78c6f23d-48e6-486a-a62a-9debc78c92fc
# ╠═1263d38a-a066-46b8-94a4-33aeaa78cdac
# ╠═b9193a58-b0fd-401a-9b53-22d87fdd52d0
# ╠═bbf34749-d02b-43c9-aea6-b6b317d07e20
# ╠═0a1010f1-758a-486f-badd-c37011353dc3
# ╠═feeb05b1-bd32-4ee3-bd7a-dfcf2bf7a58b
# ╠═d6d86037-6438-4bec-aca1-d2629c4f1f1c
# ╟─3b0f9819-c692-4d5e-af00-1574ac68f085
# ╠═62e6555a-c905-4684-bd97-ddbf3fa1a562
# ╠═3fb1baf4-7d25-4140-a6a0-ee818636a63c
# ╟─e196b619-2e4c-47c0-8452-3fbfe66708d0
# ╠═c6a3bf0a-d0d0-4ae7-af2f-c6abf1ce2196
# ╠═d62fe4b6-f911-467b-bd7d-2b8536001c60
# ╠═a592ac1a-eab2-4974-ae4c-6bc11ab9dcfc
# ╟─835f1d67-cfa6-4324-9091-4ca7aea54127
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
