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

# ╔═╡ 09d2e8d0-a125-4643-ab7a-e212677f4a1d
using PlutoUI

# ╔═╡ 04e35f10-fb1c-11ee-1415-9751c1d2d99b
md"""
# Sooyoung Kim's Think Julia 

![image](https://github.com/kimsooyoung/ThinkJulia/assets/12381733/260603e2-20ed-428e-b15b-0381f73fb46c)
"""

# ╔═╡ 9af876cf-9da8-4c96-a3a1-f218ae56d804
md"""
## Fruitful Functions (유익 함수)

실행 결과를 반환하는 함수 즉, 유의미한 값을 return하는 함수에 대해 배워보겠습니다. 
"""

# ╔═╡ 600baf14-4487-4651-a390-94cebe38fa9f
md"""
#### 6.1 Return Values (결과값)
"""

# ╔═╡ 5128c67b-d53d-4038-8782-2b16684654c3
md"""
지금까지 우리가 작성했던 함수는 입력에 따라 거북이를 움직이거나, println으로 출력을 하는 함수들이었습니다.

반면, 이번에 배울 **유익 함수**는 함수 내 코드의 실행 결과로 특정 값을 반환합니다.

예를 들어, 원의 반지름이 주어졌을 때, 원의 면적을 계산하는 함수를 구현해봅시다.
"""

# ╔═╡ 828483e1-cd0c-42bb-90ec-78a9bef76b5c
function area(radius)
	a = radius * radius * π
	return a
end

# ╔═╡ 5e790c69-05d0-4615-80b3-a6e5ce878671
md"""
!!! notes
	π는 원주율을 담고 있는 예약된 상수이며 \pi + TAB으로 사용합니다.
"""

# ╔═╡ 020ddcd0-36ce-4a15-a9ff-999f996950cc
area(3)

# ╔═╡ e60272a5-acc4-47ab-82e3-d73ac3484f41
md"""
return을 통해 계산된 원의 면적을 반환하고 있습니다. 계산된 결과는 다른 변수에 저장하여 재사용할 수 있지요. 
"""

# ╔═╡ d7638a22-4ca4-48c5-896b-ed5b9628d172
begin
	my_area = area(3)
	@show my_area * 4
end

# ╔═╡ 02d1db7a-4615-4ee5-a61d-214b01c73eb4
md"""
!!! notes
	Julia에서는 굳이 return을 작성하지 않아도 됩니다. 예를 들어 `area` 함수는 이렇게도 작성할 수 있지요. 
	```julia
	function area(radius)
		radius * radius * π
	end
	```
	함수의 가장 마지막 표현식이 return value일 것이라고 생각하여 똑똑하게 처리해준 것입니다. 하지만 이런 코딩은 실수를 유발할 수 있으므로 return을 명시하는 습관을 들입시다!
"""

# ╔═╡ 4f4fd544-d14e-4cc0-bcbf-b5b9b879a7ac
md"""
조건문을 사용하면 상황에 따라 다른 return을 갖도록 함수를 설계할 수 있습니다.  
"""

# ╔═╡ 32c9e778-10cb-4a9e-9f64-2eda574cba95
function absvalue(x)
    if x < 0
        return -x
    else
        return x
    end
end

# ╔═╡ 5643f27f-8120-4128-bf68-b66402084baf
md"""
다만, 조건문을 사용할 시 실수로 고려하지 못한 경우가 있다면 nothing을 return하는 의미 없는 함수가 될 수 있음에 유의합니다.
"""

# ╔═╡ b44b9974-6daf-4516-9799-f2d860a416d5
function absvalue_mistake(x)
    if x < 0
        return -x
    end
    if x > 0
        return x
    end
end

# ╔═╡ be9ba8ee-2885-4e04-ad0f-2682b58b80c3
md"""
위 코드에서 x=0이면 두 개의 if 중 어디에도 해당되지 않고 nothing이 return 됩니다.
"""

# ╔═╡ e74a55f7-ce0c-4bcc-a03b-4ec0c0f0dfe8
@show absvalue_mistake(0)

# ╔═╡ 40c4f27d-74d1-45da-a600-3937054a673a
md"""
!!! notes
	사실 3강에서 배웠던 함수들은 모두 nothing을 return하는 함수였던 것이지요!
"""

# ╔═╡ f8fb69a6-94ae-493e-af6d-d08250b506e6
md"""
return이 실행되는 시점에서 함수는 사실상 종료됩니다. 때문에 return 뒤에 코드를 배치한다면 해당 코드들은 절대 실행되지 않는 불필요한 코드(dead code)가 되어버립니다. 
"""

# ╔═╡ 9a695528-6a6a-4822-9925-3e6830566c5d
function area_mistake(radius)
	a = radius * radius * π
	return a
	# dead code region
	a = a + 2 * 2 * π
end

# ╔═╡ 7c34feb7-295b-4cf2-9706-873918c77508
md"""
### 연습 6-1
---
두 개의 값 x, y를 받아서 x > y이면 1을, x == y 이면 0, x < y이면 -1을 반환하는 함수 compare를 작성해 보세요. 
"""

# ╔═╡ 51f54dbc-dae1-4699-a7a5-5be587755a0a
md"""
#### 6.2 Incremental Development (점진적 개발)
"""

# ╔═╡ 089217de-9fb5-4be4-a179-62b5272f8ca2
md"""
이번 챕터에서는 예시를 통해 함수 작성을 계획하고 디버깅하면서 조금씩 완성도를 높이는 점진적 개발에 대하여 함께 실습해보겠습니다.

이번 시간 구현할 함수는 두 점 사이의 거리를 계산하는 **distance**라는 함수입니다. 수식으로 표현하면 아래와 같지요.
"""

# ╔═╡ 16516b98-0c1d-455f-8808-eddb1c819dde
md"""
$d = \sqrt{(x_2 - x_1)^2 + (y_2 - y_1)^2}$ 
"""

# ╔═╡ f7062407-d9e1-44ae-9c76-d527b97c7344
md"""
가장 먼저 생각해볼 것은 **함수의 입력**입니다. 우리의 distance함수는 4개의 값을 받아 일련의 계산을 하는 함수가 될 것이며 아래와 같이 뼈대를 잡아볼 수 있겠지요.

```julia
function distance(x1, y1, x2, y2)
	
end
```
"""

# ╔═╡ ab634e27-bf7e-4a0b-92e9-0f2b69dcb5d4
md"""
다음으로, 두 점의 x, y 좌표 사이 거리를 각각 계산해야 합니다. 이렇게 계산된 중간값은 보통 별도의 변수에 저장해둡니다. 

왜냐하면, 변수에 저장해둘 시 중간 결과는 print하거나 @show 매크로를 사용하여 확인할 수 있기 때문이지요.

```julia
function distance(x1, y1, x2, y2)
	dx = x1 - x2
	dy = y1 - y2
	@show dx dy
end
```
"""

# ╔═╡ 7c66bd02-3dd7-4308-a879-fc961b30f5d4
md"""
이제 dx와 dy를 제곱하여 더해주고 다시 제곱근을 씌워야 합니다. Julia에서 제곱근은 **sqrt()**라는 내장 함수를 사용합니다.

```julia
function distance(x1, y1, x2, y2)
	dx = x1 - x2
	dy = y1 - y2
	@show dx dy
	d = sqrt(dx^2 + dy^2)
	@show d
end
```
"""

# ╔═╡ 2f7b7b82-c16a-4b22-9606-b7da18eb237d
md"""
수식 구현이 완료되었습니다! 이제 함수의 return을 작성하고 디버깅을 위해 추가했던 @show 매크로들은 모두 제거합니다.
"""

# ╔═╡ d1590ddc-f45f-42c1-8c24-21cb71960f04
function distance(x1, y1, x2, y2)
	dx = x1 - x2
	dy = y1 - y2
	d = sqrt(dx^2 + dy^2)
	return d
end

# ╔═╡ f0092110-ba83-4cd6-ba51-4f970aa73475
distance(1,2, 4,6)

# ╔═╡ ba217f19-c531-40b8-9fec-f497be54653f
md"""
사실 마음만 먹으면 이정도 함수는 아래와 같이 매우 간단하게 구현 가능하지요.

```julia
function distance(x1, y1, x2, y2)
	sqrt((x1-x2)^2 + (y1-y2)^2)
end
```

!!! note
	하지만 앞으로 우리가 구현하는 함수는 결코 쉬운 것들만 있지 않습니다. 매우 복잡하고 긴 함수는 반드시 코딩 전 설계가 필요하며, 조금씩 구현해가면서 중간값 출력과 디버깅을 통해 검증이 필요합니다.
"""

# ╔═╡ dc18339e-57a6-4e8a-a8c0-c340af650383
md"""
### 연습 6-2
---
점진적 개발 방법을 사용해 **hypotenuse (빗변)** 함수를 작성하세요. 

이 함수는 직각삼각형의 밑변과 높이를 인수로 받아서 빗변의 길이를 반환해야 합니다. 개발 과정의 각 단계를 기록하세요.
"""

# ╔═╡ 8f028e7c-d361-4c63-a012-43caa83f45cd
md"""
#### 6.3 Composition (합성)
"""

# ╔═╡ c7c0c5eb-f9e7-4f98-b6e5-47c2a9ee4038
md"""
함수들을 구현하다보면, 이전에 구현한 것들을 재사용하고 결합해서 점차 구조적인 코드를 작성할 수 있음을 깨닫게 됩니다.

이번 챕터에서 원의 넓이를 구하는 함수 **area**와 두 점사이의 거리를 계산하는 **distance** 함수를 구현했으며 이 둘을 결합하면 2차원 평면에서 두 점을 반지름으로 갖는 원의 넓이를 계산할 수 있게 되는 것이지요!
"""

# ╔═╡ 9e94c776-634b-479d-82c2-9efc6086438a
function circlearea(xc, yc, xp, yp)
	r = distance(xc, yc, xp, yp)
	a = area(r)
	return a
end

# ╔═╡ da676dc1-3a66-4a92-ab24-92db33f7b98e
circlearea(1,2, 4,6)

# ╔═╡ 1957e3af-4f12-4fb6-a2ee-d471cdf8aacd
md"""
중간 결과값인 r, a는 함수 작성 후 아래와 같이 제거할 수 있습니다.
"""

# ╔═╡ 4c2afb2f-7f5a-440d-93a6-2b8d5ae9606a
function circlearea_simple(xc, yc, xp, yp)
	return area(distance(xc, yc, xp, yp))
end

# ╔═╡ adbd88d8-9c90-4e26-927a-775d46782465
circlearea_simple(1,2, 4,6)

# ╔═╡ 2866628c-b5d3-46b8-84f3-ca8794ffa85f
md"""
#### 6.4 Boolean Functions
"""

# ╔═╡ 278cc625-1edf-45a0-87a1-9e2361246e4e
md"""
true/false를 반환하는 Boolean 함수를 통해 복잡한 조건을 함수로 처리할 수 있습니다.

예를 들어, 임의의 수가 2와 3의 공배수인지 확인하는 조건문을 구현한다고 해봅시다.
"""

# ╔═╡ 99442cc1-dcce-43a1-af80-215fb5739285
@bind num NumberField(0:100, default=20)

# ╔═╡ ced7e878-69cb-4b5e-8262-824382553415
if (num % 2 == 0) && (num % 3 == 0)
	println("Yes - common multiple")
else
	println("No - common multiple")
end

# ╔═╡ 534ed355-9b52-407a-933d-34b8313b18e5
md"""
위의 조건식을 매우 자주 사용한다고 해봅시다. 매번 **(num % 2 == 0) && (num % 3 == 0)**를 작성하지 않고 이를 함수와 해두면 편리하게 사용할 수 있게 됩니다.
"""

# ╔═╡ c19b2a7a-d7cf-4250-a55d-7badca96977c
function checkcmm2_6(x)
	if (num % 2 == 0) && (num % 3 == 0)
		return true
	else
		return false
	end
end 

# ╔═╡ 4946a05c-4990-4db2-a4cb-ea6080146984
if checkcmm2_6(num)
	println("Yes - common multiple")
else
	println("No - common multiple")
end

# ╔═╡ 9239a271-c2e7-4fb6-b0d5-020d1f289465
md"""
#### 6.5 재귀 심화
"""

# ╔═╡ ca3f3025-5157-403f-837f-38d545e63a4a
md"""
지금까지 배운 것들로 작성할 수 있는 예시를 준비해보았습니다. 

함수에 있어 가장 프로그래밍적으로 괴랄하고 또 아름다운 것이 바로 재귀 함수인데요. 일전 (챕터 5 - 조건과 재귀)에서 살펴본 바도 있었습니다.

이번 시간에 유익 함수를 배우게 됨으로 좀 더 다채로운 재귀 함수 구현이 가능하며 아래의 **팩토리얼**을 구현해보겠습니다.
"""

# ╔═╡ 7e50d869-34be-409d-bfbf-26a827a89be6
md"""
$\begin{equation} {n! = \begin{cases} 1& \textrm{if}\ n = 0 \\ n (n-1)!& \textrm{if}\ n > 0 \end{cases}} \end{equation}$
"""

# ╔═╡ aed7c8cc-d8d4-45d9-927d-1e73e2372e7b
md"""
팩토리얼 연산에서 $0!=1$이라고 간주합니다.

따라서 $3!$의 경우 아래와 같이 연산되는 것이지요.

$3! = 3*2!$
$3! = 3*2*1!$
$3! = 3*2*1*0!$
$3! = 3*2*1*1 = 6$
"""

# ╔═╡ 107d3453-ff2f-4a6f-90b7-f4fbde85085e
md"""
이제 함수 **my_factorial**을 작성해보려 합니다. 

- my_factorial 수 하나를 받아 그것의 ! 연산을 return하는 것이므로 1개의 정수 input과 1개의 정수 output을 갖게 됨을 알 수 있습니다.
- 재귀 함수에서 주의할 점이자 가장 먼저 구현해야 하는 점은 무한 재귀가 발생하지 않도록 종료 조건을 구현하는 것입니다. my_factorial에서의 종료 조건은 $0!$에 도달했을 때입니다.

이 두가지 조건을 고려한 코드는 다음과 같아집니다.

```julia
function my_factorial(n)
	if n == 0
		return 1
	end
end
```
"""

# ╔═╡ 715c4ac8-1380-440f-9c1b-4a09c25f7a03
md"""
input n이 $0$이 아닌 경우, $n(n-1)!$을 return 하면 되겠지요. 여기서의 $(n-1)!$에도 팩토리얼 연산이 들어가게 되며 재귀로 구현해보면 아래와 같습니다.

```julia
function my_factorial(n)
	if n == 0
		return 1
	else
		return n * factorial(n-1)
	end
end
```
"""

# ╔═╡ 8acd598b-f953-40c7-85ee-2e052116d7c1
md"""
이렇게 factorial의 구현을 유익함수와 재귀를 사용하여 손쉽게 구현해 보았습니다. 복잡한 조건식을 사용하지 않고 재귀를 통해 단 5줄만에 factorial을 구현한 것이지요.

물론 고려해야 할 것도 많고, 항상 재귀를 사용할 수는 없지만 한번씩 직접 구현해보시는 것을 추천드립니다.
"""

# ╔═╡ 39f6266e-c83c-41aa-9c20-c45bb7ec71dd
md"""
!!! note
	Julia에는 factorial 함수가 이미 내장되어 있긴 합니다 ^^;;
"""

# ╔═╡ cf6845dc-1f69-473a-b783-fe548d1c5032
factorial(3)

# ╔═╡ 3e1e315f-0270-4d49-bd94-6b8ec689d0d9
md"""
### 연습 6-1
---
재귀 함수를 연습할 수 있는 좋은 문제입니다. [피보나치 수](https://ko.wikipedia.org/wiki/%ED%94%BC%EB%B3%B4%EB%82%98%EC%B9%98_%EC%88%98)를 구현해보세요!

$\begin{equation} {fib(n) = \begin{cases} 0& \textrm{if}\ n = 0 \\ 1& \textrm{if}\ n = 1 \\ fib(n-1) + fib(n-2)& \textrm{if}\ n > 1 \end{cases}} \end{equation}$

"""

# ╔═╡ 5c35ab10-0a2c-40f3-9217-31bcba331672
md"""
#### 6.6 자료형 검사
"""

# ╔═╡ 100b92b2-7747-4f16-9871-105273ed3496
md"""
> 일전 우리가 구현한 **my_factorial** 함수에 자연수가 아닌 실수를 넣게 되면 어떤 결과를 얻게 될까요?
"""

# ╔═╡ 0c997907-c394-4c0c-92b7-1d997dfedeb5
function my_factorial(n)
	if n == 0
		return 1
	else
		return n * factorial(n-1)
	end
end

# ╔═╡ c67e3878-4ec6-45c0-b85d-55220aa9fba1
my_factorial(1.5)

# ╔═╡ 11a5dbd6-e4ee-49ab-85aa-fab4301d6d6a
my_factorial(-3)

# ╔═╡ 8ba456a7-5f2c-4087-b6fb-f62a46468d97
md"""
똑똑한 Julia가 음수나 소수점을 가진 정수에 대해 위험성을 인지하고 Error을 알려주었습니다. 하지만 실제 완성도 있는 코드를 위해선 이러한 경우에 대해 모두 고려해주어야겠지요.

이런 차원에서 유익함수의 input에 대한 **자료형 검사**를 하는 방법에 대해 알아봅시다.
"""

# ╔═╡ 8941c55c-879a-48b5-a4e6-a880045153b6
function my_factorial2(n)
	if !(n isa Int64)
		error("Factorial is only defined for integers.")
	elseif n < 0
        error("Factorial is not defined for negative integers.")
	elseif n == 0
		return 1
	else
		return n * factorial(n-1)
	end
end

# ╔═╡ 5bdc08c3-3005-42ae-8459-43a2b2764f90
my_factorial2(1.5)

# ╔═╡ adb7e81f-37b5-4130-94f3-003b679b6197
my_factorial2(-5)

# ╔═╡ 0610015b-3f6d-4607-ab2a-549b7972e3b8
md"""
- 변수의 타입 조건을 확인할 수 있는 키워드 **isa**와 not 연산자를 사용해 **n이 정수가 아닌 경우에 대한 조건**을 만들었습니다.
- n이 0보다 작은 조건에 대해서도 판별했지요.

개발자인 우리는 my_factorial에 이상한 input을 넣지 않겠지만, 우리는 항상 기상천외하고 떄로는 비정상적인 사용자들에 대해 대비해야 합니다. 그것이 아마추어를 넘은 프로의 세계이지요.
"""

# ╔═╡ aa8da543-9ca4-4f9e-bc69-f26f5426ec5b
md"""
#### 6.7 재귀 함수의 디버깅
"""

# ╔═╡ 42b5282c-688b-4bb1-9930-26b0d9a2802b
md"""
함수의 실행 결과 원하는 값을 얻지 못했다면, 크게 다음과 같이 세가지 가능성이 있습니다.

1. 함수에 전달되는 인수의 문제 (전제 조건 위반)
2. 함수 구현 중 문제 (후행 조건 위반)
3. 함수 결과의 문제가 있거나, 사용 방식의 문제가 있는 경우

따라서 실행 시 원하는 동작을 얻지 못하였다면 1번부터 차근차근 디버깅을 해보시길 추천드립니다. 디버깅을 하는 방법에는 여러 옵션들이 있지만 가장 보편적인 것은 함수 내 각 step에서 중간값을 출력(show 혹은 print)하는 것이지요. 
"""

# ╔═╡ aa1e2198-d50f-4cec-a3fe-6b9ea61de874
function fact(n)
    space = " " ^ (4 * n)
    println(space, "factorial ", n)
    if n == 0
        println(space, "returning 1")
        return 1
    else
        recurse = fact(n-1)
        result = n * recurse
        println(space, "returning ", result)
        return result
    end
end

# ╔═╡ 09d9d6b3-bce2-4f91-9e54-e0343382b11f
md"""
위 fact 함수를 보시면 각 코드 step마다 println을 사용한 모습을 볼 수 있습니다. 아래의 코드 실행 결과에서 보이듯이 한눈에 코드의 흐름을 알 수 있게 적절한 print들을 배치하였지요.
"""

# ╔═╡ 073f9abf-7934-4f80-96f2-6659ab0192ef
fact(4)

# ╔═╡ cf80b26c-afec-40bb-bab4-4fb417b84bbe
md"""
함수 실행의 흐름을 확실히 하고 싶다면 시간이 다소 소요되더라고 이렇게 디버깅 출력을 심어두는 것을 추천드립니다.
"""

# ╔═╡ 7583cd1a-8e4b-4fbc-ae51-757e68f9e761
md"""
### 연습 6-2
---
[아커만 함수](https://ko.wikipedia.org/wiki/%EC%95%84%EC%BB%A4%EB%A7%8C_%ED%95%A8%EC%88%98)는 다음과 같이 정의됩니다.

$\begin{equation} {A(m, n) = \begin{cases} n+1& \textrm{if}\ m = 0 \\ A(m-1, 1)& \textrm{if}\ m > 0\ \textrm{and}\ n = 0 \\ A(m-1, A(m, n-1))& \textrm{if}\ m > 0\ \textrm{and}\ n > 0. \end{cases}} \end{equation}$



아커만 함수 값을 계산하는 함수 **ack**를 작성하세요. 작성한 함수를 이용해 **ack(3, 4)**를 계산 하고 **125**가 맞는지 확인해봅시다. 더 큰 m과 n에 대해서는 어떤 일이 벌어지나요?
"""

# ╔═╡ d9f7f80a-e1f4-4cd5-9f23-be982ffa4940
md"""
### 연습 6-3
---
noon이나 redivider처럼 뒤에서부터 읽어도 앞에서부터 읽은 것과 같은 단어를 회문(palindrome) 이라고 합니다. 재귀적으로 말하자면, 어떤 단어의 첫 글자와 마지막 글자가 같고, 가운데 부분 이 회문이면 전체가 회문입니다.

다음은 문자열 인수를 받아서 첫 글자, 마지막 글자, 중간 글자들을 돌려주는 함수입니다.

```julia
function first(word)
    first = firstindex(word)
    word[first]
end

function last(word)
    last = lastindex(word)
    word[last]
end

function middle(word)
    first = firstindex(word)
    last = lastindex(word)
    word[nextind(word, first) : prevind(word, last)]
end
```
"""

# ╔═╡ 31a6c790-d84a-43f8-a789-91d06898714c
md"""
> 이 함수들 자체의 동작 원리는 8장에서 살펴보겠습니다.

1. 이 함수들을 테스트해보세요. **middle** 함수에 두 글자로 이뤄진 문자열을 인수로 줘서 호 출하면 어떻게 됩니까? 한 글자는요? 아무 글자도 포함하지 않는 빈 문자열("")에 대해 서는 어떻습니까?
2. 문자열 인수를 받아서 회문이면 true를, 아니면 false를 반환하는 **isapalindrome** 함수를 작성하세요. 문자열의 길이는 내장 함수 **length**로 알 수 있습니다.
"""

# ╔═╡ 6afe9012-d87f-479a-9aa2-4a1ad3ef987c
md"""
### 연습 6-4
---
어떤 수 $a$가 $b$의 거듭제곱이라 함은, $a$가 $b$로 나누어 떨어지고, $\frac{a}{b}$가 $b$의 거듭제곱이라는 뜻입니다. 매개변수 $a, b$를 받아 $a$가 $b$의 거듭제곱이면 true를 반환하는 함수 **ispower**를 작성하세요.

!!! hint
	종료 조건에 대해 먼저 생각해봐야 합니다.
"""

# ╔═╡ 53e77b3f-8108-4256-a3a5-2f637cf03dbc
md"""
### 연습 6-5
---
a와 b의 최대공약수 greatest common divisor (GCD)는 두 수를 나머지 없이 나누는 수(약수) 중에
서 가장 큰 수를 가리킵니다.

최대공약수를 찾는 방법 중 하나는, a를 b로 나눈 나머지를 라고 할 때 **gcd(a, b)= gcd(b, r)**이 성립한다는 사실에 기반합니다. 종료 조건으로는 **gcd(a, 0)= a**를 사용할 수 있습니다. 

a, b를 매개변수로 받아 최대공약수를 반환하는 함수 gcd를 작성하세요.
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
git-tree-sha1 = "297b6b41b66ac7cbbebb4a740844310db9fd7b8c"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.3.1"

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
# ╟─04e35f10-fb1c-11ee-1415-9751c1d2d99b
# ╟─9af876cf-9da8-4c96-a3a1-f218ae56d804
# ╟─600baf14-4487-4651-a390-94cebe38fa9f
# ╟─5128c67b-d53d-4038-8782-2b16684654c3
# ╠═828483e1-cd0c-42bb-90ec-78a9bef76b5c
# ╟─5e790c69-05d0-4615-80b3-a6e5ce878671
# ╠═020ddcd0-36ce-4a15-a9ff-999f996950cc
# ╟─e60272a5-acc4-47ab-82e3-d73ac3484f41
# ╠═d7638a22-4ca4-48c5-896b-ed5b9628d172
# ╟─02d1db7a-4615-4ee5-a61d-214b01c73eb4
# ╟─4f4fd544-d14e-4cc0-bcbf-b5b9b879a7ac
# ╠═32c9e778-10cb-4a9e-9f64-2eda574cba95
# ╟─5643f27f-8120-4128-bf68-b66402084baf
# ╠═b44b9974-6daf-4516-9799-f2d860a416d5
# ╟─be9ba8ee-2885-4e04-ad0f-2682b58b80c3
# ╠═e74a55f7-ce0c-4bcc-a03b-4ec0c0f0dfe8
# ╟─40c4f27d-74d1-45da-a600-3937054a673a
# ╟─f8fb69a6-94ae-493e-af6d-d08250b506e6
# ╠═9a695528-6a6a-4822-9925-3e6830566c5d
# ╟─7c34feb7-295b-4cf2-9706-873918c77508
# ╟─51f54dbc-dae1-4699-a7a5-5be587755a0a
# ╟─089217de-9fb5-4be4-a179-62b5272f8ca2
# ╟─16516b98-0c1d-455f-8808-eddb1c819dde
# ╟─f7062407-d9e1-44ae-9c76-d527b97c7344
# ╟─ab634e27-bf7e-4a0b-92e9-0f2b69dcb5d4
# ╟─7c66bd02-3dd7-4308-a879-fc961b30f5d4
# ╟─2f7b7b82-c16a-4b22-9606-b7da18eb237d
# ╠═d1590ddc-f45f-42c1-8c24-21cb71960f04
# ╠═f0092110-ba83-4cd6-ba51-4f970aa73475
# ╟─ba217f19-c531-40b8-9fec-f497be54653f
# ╟─dc18339e-57a6-4e8a-a8c0-c340af650383
# ╟─8f028e7c-d361-4c63-a012-43caa83f45cd
# ╟─c7c0c5eb-f9e7-4f98-b6e5-47c2a9ee4038
# ╠═9e94c776-634b-479d-82c2-9efc6086438a
# ╠═da676dc1-3a66-4a92-ab24-92db33f7b98e
# ╟─1957e3af-4f12-4fb6-a2ee-d471cdf8aacd
# ╠═4c2afb2f-7f5a-440d-93a6-2b8d5ae9606a
# ╠═adbd88d8-9c90-4e26-927a-775d46782465
# ╟─2866628c-b5d3-46b8-84f3-ca8794ffa85f
# ╟─278cc625-1edf-45a0-87a1-9e2361246e4e
# ╠═09d2e8d0-a125-4643-ab7a-e212677f4a1d
# ╠═99442cc1-dcce-43a1-af80-215fb5739285
# ╠═ced7e878-69cb-4b5e-8262-824382553415
# ╟─534ed355-9b52-407a-933d-34b8313b18e5
# ╠═c19b2a7a-d7cf-4250-a55d-7badca96977c
# ╠═4946a05c-4990-4db2-a4cb-ea6080146984
# ╟─9239a271-c2e7-4fb6-b0d5-020d1f289465
# ╟─ca3f3025-5157-403f-837f-38d545e63a4a
# ╟─7e50d869-34be-409d-bfbf-26a827a89be6
# ╟─aed7c8cc-d8d4-45d9-927d-1e73e2372e7b
# ╟─107d3453-ff2f-4a6f-90b7-f4fbde85085e
# ╟─715c4ac8-1380-440f-9c1b-4a09c25f7a03
# ╟─8acd598b-f953-40c7-85ee-2e052116d7c1
# ╟─39f6266e-c83c-41aa-9c20-c45bb7ec71dd
# ╠═cf6845dc-1f69-473a-b783-fe548d1c5032
# ╟─3e1e315f-0270-4d49-bd94-6b8ec689d0d9
# ╟─5c35ab10-0a2c-40f3-9217-31bcba331672
# ╟─100b92b2-7747-4f16-9871-105273ed3496
# ╠═0c997907-c394-4c0c-92b7-1d997dfedeb5
# ╠═c67e3878-4ec6-45c0-b85d-55220aa9fba1
# ╠═11a5dbd6-e4ee-49ab-85aa-fab4301d6d6a
# ╟─8ba456a7-5f2c-4087-b6fb-f62a46468d97
# ╠═8941c55c-879a-48b5-a4e6-a880045153b6
# ╠═5bdc08c3-3005-42ae-8459-43a2b2764f90
# ╠═adb7e81f-37b5-4130-94f3-003b679b6197
# ╠═0610015b-3f6d-4607-ab2a-549b7972e3b8
# ╟─aa8da543-9ca4-4f9e-bc69-f26f5426ec5b
# ╟─42b5282c-688b-4bb1-9930-26b0d9a2802b
# ╠═aa1e2198-d50f-4cec-a3fe-6b9ea61de874
# ╟─09d9d6b3-bce2-4f91-9e54-e0343382b11f
# ╠═073f9abf-7934-4f80-96f2-6659ab0192ef
# ╟─cf80b26c-afec-40bb-bab4-4fb417b84bbe
# ╟─7583cd1a-8e4b-4fbc-ae51-757e68f9e761
# ╟─d9f7f80a-e1f4-4cd5-9f23-be982ffa4940
# ╟─31a6c790-d84a-43f8-a789-91d06898714c
# ╟─6afe9012-d87f-479a-9aa2-4a1ad3ef987c
# ╟─53e77b3f-8108-4256-a3a5-2f637cf03dbc
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
