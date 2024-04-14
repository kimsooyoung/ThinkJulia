### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ 4682e840-f8d9-11ee-38b6-bfd0f6e9c442
md"""
# Sooyoung Kim's Think Julia 

![image](https://github.com/kimsooyoung/ThinkJulia/assets/12381733/260603e2-20ed-428e-b15b-0381f73fb46c)
"""

# ╔═╡ 5788c715-d06b-4342-9e7e-c76e3280a5eb
md"""
## Conditionals and Recursion (조건과 재귀)

프로그래밍 로직에서 반드시 필요한 조건문, if에 대해서 배워봅시다.

!!! notes
	강의 마지막에 제시되는 연습문제들을 꼭 풀어보세요! 프로그래밍 실력이 빠르게 성장하는 비결은 많은 코드와 실수를 해보는 것입니다.
"""

# ╔═╡ 91d6d374-9522-403f-9355-94654d2ba8a8
md"""
#### 5.1 Division and Modulus (몫과 나머지 연산자)
"""

# ╔═╡ 2a6e339b-e82a-4d5b-94f7-468ed751a63c
md"""
몫 연산자(÷)는 두 수를 나눈 값에서 소수점 첫째 자리를 버리는 연산입니다. julia에서 **\div**를 입력한 뒤, TAB 키를 입력하면 사용할 수 있습니다.

!!! warning
	일반 나누기 연산자(/)는 부동 소수점으로 표현할 수 있는 범위까지 나눗셈을 합니다. 아래의 예시를 통해 직접 확인해보세요!
"""

# ╔═╡ 966ee679-792b-4786-8fb0-c019fe058061
begin
	mins = 105
	@show mins / 60
	@show mins ÷ 60
end

# ╔═╡ 8664a381-a7e8-4a13-be97-ff31b3695502
md"""
나머지 연산자(%)는 키보드 상에서 shift + 5를 눌렀을 때 등장하는 문자이며 두 수를 나눈 결과에서 나머지만을 계산합니다.

앞서 배운 몫 연산과 나머지 연산을 사용하면 수의 원형을 복원할 수 있겠지요. 아래의 예시를 함께 살펴봅시다.
"""

# ╔═╡ 56a0d568-5c5f-440d-9625-d7e050511684
begin
	mins_origin = 135
	hours = mins_origin ÷ 60
	left_mins = mins_origin % 60

	mins_recovered = hours*60 + left_mins 
	@show mins_recovered
end

# ╔═╡ 18e46041-f45a-48e9-999a-0285eec7845e
md"""
#### 5.2 논리 표현식
"""

# ╔═╡ 32a69331-d913-41c2-924e-daf3007160e0
md"""
논리 표현식은 결과가 true 혹은 false인 표현식입니다. 여기서의 true/false는 문자열이 아니라 Julia에서 참과 거짓을 표현하는 Bool 타입의 특별한 값입니다.
"""

# ╔═╡ d91ae4e8-d44a-49fd-b1fb-9302921e380c
begin
	@show 3 * 7 == 7 * 3
	@show "South Korean" == "North Korean"
	@show true == true
end

# ╔═╡ cb4c7c67-2685-4603-9c3c-f79308cd763d
md"""
!!! notes
	Julia에서 변수의 타입을 조회할 시 typeof() 함수의 매개변수로 변수를 전달해주면 됩니다.
	```julia
	typeof(true)
	> Bool
	```
"""

# ╔═╡ 5b96b01f-22c8-4556-80b1-1e91149d9b77
md"""
앞선 코드에서의 **==** 연산자는 해당 연산자 좌우를 비교하여 둘이 서로 같은 값인지 확인하고 동일 여부에 따라 true 혹은 false를 반환하게 됩니다.

Julia에서 두 값 사이의 관계를 판별하는 여러 연산자들이 있습니다. 아래를 확인해보세요.

|기본값|가운데 정렬|
|---|:---:|
|**x!=y**|x와 y는 같지 않다.|
|**x≠ y**|\ne + TAB|
|**x> y**|x가 y보다 크다.|
|**x< y**|x가 y보다 작다.|
|**x>=y**|x가 y보다 크거나 같다.|
|**x≥ y**|\ge + TAB|
|**x<=y**|x가 y보다 작거나 같다.|
|**x≤ y**|\le + TAB|
"""

# ╔═╡ 04a21053-47ff-4dff-b0dc-fea61ed03826
md"""
#### 5.3 논리 연산자
"""

# ╔═╡ 48c4d2e3-c493-42cc-92ea-ec61df627401
md"""
논리 연산자는 **&& (논리곱)**, **|| (논리합)**, **!(부정)** 세 종류가 있으며 논리곱과 논리합은 좌우 표현의 true/false 여부에 따라 다른 결과를 갖고, 부정은 잇따르는 표현의 true/false 여부를 반전시킵니다. 예시를 통해 살펴보겠습니다.
"""

# ╔═╡ af803df4-0c47-4670-af29-2926233e619b
begin
	due_mins = 63

	# && 연산자는 좌우 표현식이 모두 true일때만 true가 됩니다.
	println((due_mins % 60 == 3) && (due_mins >= 0))
	println((due_mins % 60 == 3) && (due_mins == 0))
	# || 연산자는 좌우 표현식 중 하나라도 true라면 true가 됩니다.
	println((due_mins % 60 != 3) || (due_mins < 0))
	println((due_mins % 60 == 3) || (due_mins >= 0))
	println((due_mins % 60 != 3) || (due_mins >= 0))
 	#! 연산자는 결과값을 반전시킵니다.
	println(!true)
	println(!false)
	println(!(due_mins > 0))
end

# ╔═╡ 1183cca0-0236-49c9-8fa1-999520dd5470
md"""
#### 5.4 조건부 실행
"""

# ╔═╡ b5751011-5df7-4053-bfd3-5fc44adc39e3
md"""
특정 조건을 만족했을 경우에만 코드를 실행하도록 하고 싶은 때 사용하는 if문입니다.

if문 다음으로 등장하는 조건식 부분에 앞서 배운 논리 연산자, 논리 표현식을 사용하는 것이지요!

> 특정 변수가 0보다 큰지, 0보다 작은지, 혹은 0인지를 판단하는 코드를 작성해봅시다.
"""

# ╔═╡ 8e85fca0-95b8-4ccd-9a18-8b144aec8626
begin
	if due_mins > 0
		println("$due_mins is greather than zero.")
	end
	if due_mins < 0
		println("$due_mins is less than zero.")
	end
	if due_mins == 0
		println("$due_mins is zero.")
	end
end

# ╔═╡ c307560e-c849-4e77-b35a-766ebb04065c
md"""
#### 5.5 대체 실행
"""

# ╔═╡ 2305943b-7b0a-4606-b617-2287bdc51446
md"""
앞선 코드에서 if 문을 3개 사용하였는데, 사실 이 코드는 **elseif**와 **else**라는 표현을 사용하면 훨씬 편리하게 구현할 수 있습니다.

if문을 만족하진 않지만, 조건을 추가하고 싶은 경우 **elseif + 새로운 표현식**을 사용합니다. 예시를 살펴보겠습니다.
"""

# ╔═╡ 85de1edf-b29c-485e-95d0-f8c2f5fbc613
begin
	if due_mins > 0
		println("$due_mins is greather than zero.")
	elseif due_mins < 0
		println("$due_mins is less than zero.")
	elseif due_mins == 0
		println("$due_mins is zero.")
	end
end

# ╔═╡ 3b1c50bf-3479-4478-97e3-9fc9d5ab27d4
md"""
**else**문은 앞선 if와 elseif를 모두 만족하지 못한 경우, 조건문 최후에 구현하는 표현으로 앞선 조건 모두가 false인 경우에만 도달할 수 있습니다.

else를 사용하여 앞선 코드를 다시 구현하면 다음과 같습니다.
"""

# ╔═╡ 73faec45-da4d-4207-9b9c-ddb4c49175f9
begin
	if due_mins > 0
		println("$due_mins is greather than zero.")
	elseif due_mins < 0
		println("$due_mins is less than zero.")
	else
		println("$due_mins is zero.")
	end
end

# ╔═╡ 543eecf0-1708-4f83-8f24-cf68cea0e3e0
md"""
!!! notes
	추가할 수 있는 elseif의 수는 제한이 없습니다.
"""

# ╔═╡ 5c52ca3b-9973-4517-a045-8dfdfc411ab8
md"""
!!! warning
	else는 추가 조건을 사용할 수 없으며, 앞선 조건들이 모두 false인 경우에만 도달할 수 있기 때문에 모든 경우의 수를 생각하고 난 뒤 신중하게 구현합시다.
"""

# ╔═╡ ce88cdfa-497f-4ba0-9166-f8e678da5f4f
md"""
#### 5.6 중첩 조건문
"""

# ╔═╡ Cell order:
# ╟─4682e840-f8d9-11ee-38b6-bfd0f6e9c442
# ╟─5788c715-d06b-4342-9e7e-c76e3280a5eb
# ╟─91d6d374-9522-403f-9355-94654d2ba8a8
# ╟─2a6e339b-e82a-4d5b-94f7-468ed751a63c
# ╠═966ee679-792b-4786-8fb0-c019fe058061
# ╟─8664a381-a7e8-4a13-be97-ff31b3695502
# ╠═56a0d568-5c5f-440d-9625-d7e050511684
# ╟─18e46041-f45a-48e9-999a-0285eec7845e
# ╟─32a69331-d913-41c2-924e-daf3007160e0
# ╠═d91ae4e8-d44a-49fd-b1fb-9302921e380c
# ╟─cb4c7c67-2685-4603-9c3c-f79308cd763d
# ╟─5b96b01f-22c8-4556-80b1-1e91149d9b77
# ╟─04a21053-47ff-4dff-b0dc-fea61ed03826
# ╟─48c4d2e3-c493-42cc-92ea-ec61df627401
# ╠═af803df4-0c47-4670-af29-2926233e619b
# ╟─1183cca0-0236-49c9-8fa1-999520dd5470
# ╟─b5751011-5df7-4053-bfd3-5fc44adc39e3
# ╠═8e85fca0-95b8-4ccd-9a18-8b144aec8626
# ╟─c307560e-c849-4e77-b35a-766ebb04065c
# ╟─2305943b-7b0a-4606-b617-2287bdc51446
# ╠═85de1edf-b29c-485e-95d0-f8c2f5fbc613
# ╟─3b1c50bf-3479-4478-97e3-9fc9d5ab27d4
# ╠═73faec45-da4d-4207-9b9c-ddb4c49175f9
# ╟─543eecf0-1708-4f83-8f24-cf68cea0e3e0
# ╟─5c52ca3b-9973-4517-a045-8dfdfc411ab8
# ╟─ce88cdfa-497f-4ba0-9166-f8e678da5f4f
