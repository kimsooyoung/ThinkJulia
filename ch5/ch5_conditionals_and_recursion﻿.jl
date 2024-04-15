### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ aee2cfef-3d88-4bf0-bc50-050ad4298d3f
using PlutoUI

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

# ╔═╡ 155198b9-ac7f-4469-9e3a-eb5e3b267ddd
md"""
조건문(if-end)은 여러개를 중첩하여 사용할 수 있습니다.

하지만 너무 많은 중첩문은 코드의 가속성을 떨어뜨리고 예기치 못한 오류 상황을 유발합니다.
"""

# ╔═╡ 883b3c9e-0b71-42c1-9831-fd729a2fb69f
begin
	x = 3
	y = 2
	if x == y
	    println("x and y are equal")
	else
	    if x < y
	        println("x is less than y")
	    else
	        println("x is greater than y")
	    end
	end
end

# ╔═╡ eb48920a-a977-4994-8900-f4742b59585f
md"""
중첩 조건문을 피하는 좋은 방법은 앞서 배운 논리 연산자 (&&, ||, !)를 사용하는 것입니다.

예를 들어, 아래와 같은 코드는

```
if 0 < x
    if x < 10
        println("x is a positive single-digit number.")
    end
end
```

이렇게 논리 연산자 &&를 사용하여 간소화할 수 있습니다.

```
if 0 < x && x < 10
    println("x is a positive single-digit number.")
end
```

추가로 Julia는 아래와 같은 문법도 지원합니다.

```
if 0 < x < 10
    println("x is a positive single-digit number.")
end
```

"""

# ╔═╡ 8509ddbf-ff44-4dc4-820f-55570a057764
md"""
#### 5.7 Recursion - 재귀 
"""

# ╔═╡ 930c24b2-902f-4411-8e8c-0a0e9df9eaac
md"""
자기 자신을 호출하는 함수를 재귀 함수라고 합니다.

자기 자신을 호출한다는 것이 와닿지 않으실 것 같은데요, 예시를 통해 먼저 확인해보겠습니다.
"""

# ╔═╡ fbe8129d-df3b-413e-a1eb-af93e3e5678d
function countdown(n)
	if n ≤ 0
		println("Boom!!")
	else
		print("$n ")
		countdown(n-1)
	end
end

# ╔═╡ fc718ff4-c5d7-4ec5-a852-8e7f3b8003d1
countdown(3)

# ╔═╡ 671e7caa-3eac-4f27-a3df-bb8b79e7548a
md"""
> 카운트 다운을 세면서 3, 2, 1로 점차 숫자가 작아지다가 0이 되는 순간 Boom!하고 출력이 됩니다.

위 코드가 어떻게 실행되었는지 차근차근 분석해봅시다.

	1. 먼저 countdown이 시작합니다 (매개변수 n = 3). 
		n이 0보다 크기 때문에 3을 출력하고, 자기 자신을 호출합니다.
	2. countdown이 시작합니다 (매개변수 n = 2). 
		n이 0보다 크기 때문에 2를 출력하고, 자기 자신을 호출합니다.
	3. countdown이 시작합니다 (매개변수 n = 1). 
		n이 0보다 크기 때문에 1을 출력하고, 자기 자신 을 호출합니다.
	4. countdown이 시작합니다(매개변수 n = 0). 
		이번에는 n이 0보다 크지 않기 때문에 "Boom!!"을 출력하고 종료합니다.

	5. n = 1을 받은 countdown이 종료됩니다.
	6. n = 2를 받은 countdown이 종료됩니다.
	7. n = 3을 받은 countdown이 종료됩니다.
	8. 마지막으로 처음 출발한 Main으로 돌아왔습니다.
"""

# ╔═╡ 46d4dc6a-08d7-46c6-b08f-01b258ed9605
md"""
재귀 함수는 사실 for loop라는 반복문을 사용해서도 구현할 수 있지만 몇몇 문제들의 경우 재귀를 사용할 시 훨씬 간편하게 구현 가능하기에 종종 사용되는 기법입니다.

재귀 함수를 작성할 시의 팁을 드리자면

1. 종료 상황에 대한 조건 
2. 재귀 함수의 매개변수
3. 매번 함수 실행마다 변화하는 조건

적어도 위 세가지 구현을 **어떻게 구현할지 먼저 생각하고 키보드에 손을 얹는 것입니다.**

!!! notes
	강의 마지막에 재귀 함수에 대한 연습 문제들을 준비해 두었습니다. 꼭 풀어보세요!
"""

# ╔═╡ 4e922722-74bc-4f7b-930a-3f33bdb11330
md"""
#### 5.8 Infinite Recursion - 무한 재귀 
"""

# ╔═╡ 1c9f34f0-6db2-4261-b3f7-6ba64d900d8b
md"""
재귀 함수를 구현할 시 고려해야 할 1번으로 **종료 조건**을 언급했습니다. 

이를 1번으로 둔 이유는 만약 재귀 함수에 종료 조건이 없다면 함수가 끝나지 않는 **무한 재귀**에 빠지기 떄문입니다.
"""

# ╔═╡ 2d1ea05d-7be2-404b-8776-afeefca9d646
function inf_recursion()
	# println("inf_recursion")
	inf_recursion()
end

# ╔═╡ a0ef7dbc-33be-45ab-bf77-a2bb8425daf9
inf_recursion()

# ╔═╡ 02d02ba7-cc0d-45f3-833c-8df57255eff0
md"""
Julia를 비롯하여 대부분의 프로그래밍 언어들은 무한 재귀를 허용하지 않고 위와 같이 Stack Overflow 
 Error로서 사용자에게 경고를 남깁니다.

하지만 복잡한 로직에서 무한 재귀가 발생하게 되면, 이는 CPU를 점유하고 전체 시스템을 마비시킬 수 있습니다. 따라서 재귀 함수를 구현하고자 한다면 항상 종료 조건은 먼저 구현하세요!
"""

# ╔═╡ 64ae36c1-b381-497f-b276-ee5ebdcc4f24
md"""
#### 5.9 키보드 입력 
"""

# ╔═╡ bf9e0cce-36ff-462d-a5b3-02ab87b46044
md"""
조건문과 관련된 내용은 아니지만 더욱 풍선한 구현을 위해 인터페이스 하나를 배워보고자 합니다. 

사용자의 입력을 받는 **readline()**함수를 사용하면 해당 코드가 실행되는 시점에서 프로그램은 잠시 동작을 멈추고 사용자로부터의 입력을 기다립니다. 

사용자가 특정 입력을 전달하고 Enter를 입력하면 Julia는 이를 **문자열**로 프로그램에 전달합니다. 

```julia
julia> print("What is your name? : ");readline()
What is your name? : Sooyoung Kim
"Sooyoung Kim"
```
"""

# ╔═╡ 169c87c7-a64c-40bb-9252-f86d7e89ba13
md"""
!!! notes
	현재 우리는 Pluto를 사용하고 있기 때문에 readline을 직접적으로 사용할 수는 없습니다. 하지만 [PlutoUI](https://featured.plutojl.org/basic/plutoui.jl)를 사용하여 아래와 같이 interactive한 프로그래밍이 가능합니다.
"""

# ╔═╡ ac6c9eea-4f05-49fc-a65f-cb2158fd4b0d
@bind s TextField()

# ╔═╡ 8a99f4f4-d27e-4724-998c-e36a193ea15e
println(s)

# ╔═╡ 85cba791-3c09-4a68-8320-2627be4c4921
md"""
readline을 사용할 시 주의해야 할 점은 모든 입력값은 문자열로 전달된다는 것입니다.

만약 입력된 값을 **숫자로 변환**하고 싶다면 아래와 같이 사용합니다.

```julia
julia> print("How old are you? : "); age = readline()
How old are you? : 42
"42"
julia> parse(Int64, age)
42
```
"""

# ╔═╡ e633ad61-a842-4218-b1bc-9a43fda98d3f
md"""
### 연습 5-1
---
`time` 함수는 임의의 기준 시각인 epoch으로부터 현재까지의 경과한 시간을 초 단위로 반환합 니다. 유닉스 시스템에서 epoch은 그리니치 평균시로 1970년 1월 1일 0시 0분 0초입니다.

```julia
julia> time()
1.550846226624217e9
```

현재 시간을 읽어, epoch으로부터 경과한 날짜와 나머지 시분초를 구하는 스크립트를 작성하세요.
"""

# ╔═╡ 3697967f-6df2-45bd-aaa6-6aef6a805ba5
md"""
### 연습 5-2
---
페르마의 마지막 정리는 2보다 큰 정수 에 대해서 다음 식을 만족시키는 양의 정수 a, b, c가
존재하지 않는다는 정리입니다.

$a^n + b^n = c^n$

1. 네 개의 매개변수 $a$, $b$, $c$, $n$에 대해서 페르마의 마지막 정리가 성립하는지 검사하는 **checkfermat** 함수를 작성하세요. 2보다 큰 n에 대해서 $a^n+b^n == c^n$을 만족하면, "Holy smokes, Fermat was wrong!" ("헉, 페르마가 틀렸네!")을 출력하고, 그렇지 않 으면 "No, that doesn't work." ("아니요, 안 됩니다.")를 출력하세요.

2. 사용자에게 $a$, $b$, $c$, $n$을 입력받아 이를 정수로 변환한 후, **checkfermat** 함수를 이용해 페르마의 정리에 위배되는지 검사하는 함수를 작성하세요.
"""

# ╔═╡ 1e301f14-7684-478e-be5b-80f9cf2ac9cb
md"""
### 연습 5-3
---
막대기 세 개가 있을 때, 어떤 경우에는 막대들로 삼각형을 만들 수 있고, 어떤 경우에는 그럴 수 없습니다. 예를 들어 막대 하나의 길이가 12인치이고, 나머지 두 개가 각각 1인치라면, 짧은 두 개의 막대가 삼각형을 이루도록 중간에서 만나게 할 수 없을 것입니다. 

임의로 세 개의 길이 가 주어질 때, 그것을 변의 길이로 가진 삼각형을 만들 수 있을지 알 수 있는 간단한 시험 방법은 다음과 같습니다.

> 어떤 변이 다른 두 개를 더한 것보다 길다면, 삼각형을 만들 수 없다. 그런 변이 존재하지 않는다면, 삼각형을 만들 수 있습니다. (만일 한 변의 길이가 다른 두 개를 더한 것과 같다면, 퇴화(degenerate) 삼각형이라는 도형이 됩니다.)

1. 세 개의 정수를 인수로 받아, 그것을 길이로 하는 삼각형을 생성할 수 있는지를 판단하고, 그 결과에 따라 "Yes" 또는 "No"를 출력하는 함수 **istriangle**을 작성하세요.

2. 세 개의 길이를 사용자로부터 입력받고 이를 정수로 변환한 후, 그것을 길이로 하는 삼각형을 생성할 수 있을지를, **istriangle** 함수를 이용해서 판단하는 함수를 작성하세요.
"""

# ╔═╡ 7903bc3a-b359-44b6-a507-d6f45e88ff49
md"""
### 연습 5-4
---
![image](https://github.com/kimsooyoung/ThinkJulia/assets/12381733/f8b26775-3877-44eb-9e78-de9fe320fb27)

위의 도형은 코크 곡선이라 불리는 프렉탈 도형입니다. 

가로 길이가 $x$인 코크 곡선을 만드는 방법은 다음과 같습니다.

1. 길이가 $\frac{x}{3}$인 코크 곡선을 그린다.
2. 왼쪽으로 60도 회전한다.
3. 길이가 $\frac{x}{3}$인 코크 곡선을 그린다.
4. 오른쪽으로 120도 회전한다.
5. 길이가 $\frac{x}{3}$인 코크 곡선을 그린다.
6. 왼쪽으로 60도 회전한다.
7. 길이가 $\frac{x}{3}$인 코크 곡선을 그린다.

길이 $x$가 3보다 작은 경우에는 예외적으로, 그냥 길이가 $x$인 직선을 그립니다.

1. 거북이와 길이를 매개변수로 받아서, 받은 길이만큼의 코크 곡선을 거북이로 그리는 함수 **koch**를 작성하세요.
2. 눈송이 모양이 되도록 세 개의 코크 곡선을 그리는 함수 **snowflake**를 작성하세요.
3. 코크 곡선은 여러 가지 방식으로 일반화할 수 있습니다. 영문 위키백과의 [코크 곡선 항목](https://en.wikipedia.org/wiki/Koch_snowflake)에서 다른 예들을 찾아보고, 마음에 드는 것을 구현해보세요.

![image](https://github.com/kimsooyoung/ThinkJulia/assets/12381733/474aebfb-0831-4192-a41c-13bc62afbf72)
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.58"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "0f748c81756f2e5e6854298f11ad8b2dfae6911a"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.3.0"

[[ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "b10d0b65641d57b8b4d5e234446582de5047050d"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.5"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "179267cfa5e712760cd43dcae385d7ea90cc25a4"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.5"

[[HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "7134810b1afce04bbc1045ca1985fbe81ce17653"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.5"

[[IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "8b72179abc660bfab5e28472e019392b97d0985c"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.4"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[LinearAlgebra]]
deps = ["Libdl"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "8489905bcdbcfac64d1daa51ca07c0d8f0283821"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.8.1"

[[Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "71a22244e352aa8c5f0f2adde4150f62368a3f2e"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.58"

[[PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "5aa36f7049a63a1528fe8f7c3f2113413ffd4e1f"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.2.1"

[[Preferences]]
deps = ["TOML"]
git-tree-sha1 = "9306f6085165d270f7e3db02af26a400d580f5c6"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.4.3"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[Tricks]]
git-tree-sha1 = "eae1bb484cd63b36999ee58be2de6c178105112f"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.8"

[[URIs]]
git-tree-sha1 = "67db6cc7b3821e19ebe75791a9dd19c9b1188f2b"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.5.1"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
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
# ╟─155198b9-ac7f-4469-9e3a-eb5e3b267ddd
# ╠═883b3c9e-0b71-42c1-9831-fd729a2fb69f
# ╟─eb48920a-a977-4994-8900-f4742b59585f
# ╟─8509ddbf-ff44-4dc4-820f-55570a057764
# ╟─930c24b2-902f-4411-8e8c-0a0e9df9eaac
# ╠═fbe8129d-df3b-413e-a1eb-af93e3e5678d
# ╠═fc718ff4-c5d7-4ec5-a852-8e7f3b8003d1
# ╟─671e7caa-3eac-4f27-a3df-bb8b79e7548a
# ╟─46d4dc6a-08d7-46c6-b08f-01b258ed9605
# ╟─4e922722-74bc-4f7b-930a-3f33bdb11330
# ╟─1c9f34f0-6db2-4261-b3f7-6ba64d900d8b
# ╠═2d1ea05d-7be2-404b-8776-afeefca9d646
# ╠═a0ef7dbc-33be-45ab-bf77-a2bb8425daf9
# ╟─02d02ba7-cc0d-45f3-833c-8df57255eff0
# ╟─64ae36c1-b381-497f-b276-ee5ebdcc4f24
# ╟─bf9e0cce-36ff-462d-a5b3-02ab87b46044
# ╟─169c87c7-a64c-40bb-9252-f86d7e89ba13
# ╠═aee2cfef-3d88-4bf0-bc50-050ad4298d3f
# ╠═ac6c9eea-4f05-49fc-a65f-cb2158fd4b0d
# ╠═8a99f4f4-d27e-4724-998c-e36a193ea15e
# ╟─85cba791-3c09-4a68-8320-2627be4c4921
# ╟─e633ad61-a842-4218-b1bc-9a43fda98d3f
# ╟─3697967f-6df2-45bd-aaa6-6aef6a805ba5
# ╟─1e301f14-7684-478e-be5b-80f9cf2ac9cb
# ╟─7903bc3a-b359-44b6-a507-d6f45e88ff49
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
