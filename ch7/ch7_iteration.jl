### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ e2e596e0-fcc8-11ee-2a95-2b0490ab06df
md"""
# Sooyoung Kim's Think Julia 

![image](https://github.com/kimsooyoung/ThinkJulia/assets/12381733/260603e2-20ed-428e-b15b-0381f73fb46c)
"""

# ╔═╡ d0e7ba49-6828-4f55-b704-a30bcc4c2079
md"""
## Iteration (반복)

이번 챕터에서는 반복 키워드인 while에 대해서 배워봅니다. 사실 이전 챕터 4에서 for-loop, 챕터 5에서 재귀를 통한 반복문을 배운 바 있습니다.

비슷한 유형의 반복문인데 왜 굳이 3가지 종류가 있어야 할까요? 그만큼 프로그래밍에서 반복이 자주 사용되고, 프로그램들 자체가 조건을 가진 반복으로 구성되어 있기 때문입니다.

반복문까지 마무리하면 이론적으로 여러분은 그 어떠한 문제도 프로그래밍으로 구현할 수 있습니다. 이것에 대해 궁금하다면 [튜링 완전](https://ko.wikipedia.org/wiki/%ED%8A%9C%EB%A7%81_%EC%99%84%EC%A0%84)에 대해 찾아보세요!
"""

# ╔═╡ 357fbabc-bf4c-49d4-adbe-92026e5491ad
md"""
#### 7.1 Reassignment and Updating (재할당과 갱신)
"""

# ╔═╡ 05a60bc6-2e23-4266-99ca-cfd0242d9c12
md"""
while문을 배우기 전, while과 함께 자주 사용되는 구문을 먼저 알아보고 넘어갈까 합니다. 아래 퀴즈를 한번 풀어보세요!

!!! correct "Quiz"
	아래 코드의 결과를 예측해 보세요
	```juila
	a = 3
	b = a
	a = 4
	@show b
	```
"""

# ╔═╡ 259ae0b1-74df-4b7f-a060-d82d64c29337
md"""
!!! hint "정답"
	> b = 3
	b = a이므로 a가 바뀌면 b도 바뀌어야 할 것 같지만 julia에서 한 번 할당된 변수는 독립적으로 자신의 값을 저장합니다. 따라서 a가 바뀌어도 b는 이전 a의 값인 3을 담고 있게 되지요.
"""

# ╔═╡ 89a454ca-3d22-4729-83c3-3196f55eed6e
md"""
이러한 이유로 변수값의 재할당을 구현하는 것은 항상 조심해야 합니다.
"""

# ╔═╡ 89875980-6088-4ade-80ec-1e8b856eb0f5
md"""
> 다음으로, **변수의 갱신**에 대해 알아보겠습니다. 

개인적으로 매우 자주 사용하는 구문으로 특히 반복문과 함께 사용됩니다. 예시를 살펴보겠습니다.
"""

# ╔═╡ c4669b73-9bd5-4016-bd33-05b1882e6609
begin
	x = 0
	x = x + 1
	@show x
	x += 1
	@show x

	y = 0
	y = y - 1
	@show y
	y -= 1
	@show y

	z = 1
	z = z * 3
	@show z
	z *= 3
	@show z
end

# ╔═╡ 17ba035e-899d-4614-96b8-f39377782885
md"""
위 예시와 같이 `sth = sth + 1` 혹은 `sth += 1`의 구문으로 현재 변수에 1을 갱신하는 작업을 구현 가능합니다. 예를 들어 아래와 같이 for loop와 함께 사용될 수 있습니다. 
"""

# ╔═╡ 9694a4b6-7ad5-4faa-9ba1-5e491799717e
begin
	is_even = 0
	for i in 1:10
		if i % 2 == 0
			is_even += 1
		end
	end
	println("is_even : ", is_even)
end

# ╔═╡ 026679c6-fa51-4327-832f-b2d78e602c57
md"""
#### 7.2 while 문
"""

# ╔═╡ 02bb096a-06ce-4cf4-b40c-4ec8e001692b


# ╔═╡ Cell order:
# ╟─e2e596e0-fcc8-11ee-2a95-2b0490ab06df
# ╟─d0e7ba49-6828-4f55-b704-a30bcc4c2079
# ╟─357fbabc-bf4c-49d4-adbe-92026e5491ad
# ╟─05a60bc6-2e23-4266-99ca-cfd0242d9c12
# ╟─259ae0b1-74df-4b7f-a060-d82d64c29337
# ╟─89a454ca-3d22-4729-83c3-3196f55eed6e
# ╟─89875980-6088-4ade-80ec-1e8b856eb0f5
# ╠═c4669b73-9bd5-4016-bd33-05b1882e6609
# ╟─17ba035e-899d-4614-96b8-f39377782885
# ╠═9694a4b6-7ad5-4faa-9ba1-5e491799717e
# ╟─026679c6-fa51-4327-832f-b2d78e602c57
# ╠═02bb096a-06ce-4cf4-b40c-4ec8e001692b
