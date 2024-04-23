### A Pluto.jl notebook ###
# v0.19.40

using Markdown
using InteractiveUtils

# ╔═╡ 4b826b26-811e-4087-9f0f-a1c6336ba741
begin
	import Pkg; Pkg.add("Luxor")
	import Pkg; Pkg.add(url="https://github.com/BenLauwens/ThinkJulia.jl")
end

# ╔═╡ fe8ac563-cf71-4091-a302-10ad102fda7c
begin
	using ThinkJulia
	using Luxor
end

# ╔═╡ 2a0ec542-f284-11ee-3c0b-6b17b56aeaa8
md"""
# Sooyoung Kim's Think Julia 

![image](https://github.com/kimsooyoung/ThinkJulia/assets/12381733/260603e2-20ed-428e-b15b-0381f73fb46c)
"""

# ╔═╡ 796d4c0c-09fd-4841-bf90-063e593ecadc
md"""
## Case study - Interface Design

ThinkJulia에는 여러가지 유용한 사례들을 제시하고, 이를 Julia로 프로그래밍하는 실습 챕터가 마련되어 있습니다. 함수까지 학습한 이 시점에서, 흥미로운 예시를 통해 Julia의 함수들을 어떻게 설계하는지 알아보겠습니다.

> 아래 그림은 순수 Julia를 사용해서 만들어졌습니다.

![luxor](https://github.com/kimsooyoung/ThinkJulia/assets/12381733/82f5e105-fba4-4640-ae1c-e614939c536b)
"""

# ╔═╡ 4046af5b-eb09-4eb7-a4f1-70bec4b7e057
md"""
!!! warning
	이번 챕터를 위해 새로운 패키지를 추가로 설치하고, 사용하고자 합니다. 아래의 Cell을 실행해야 앞으로의 모든 예시들을 실행 가능하니 꼭 짚고 넘어가주세요!
"""

# ╔═╡ f49b22e1-e985-46e5-9a0f-20c93a178eb5
md"""
**Julia의 Built-In Function이 아닌 제 3의 라이브러리를 사용하고자 한다면** 
1) 지금과 같이 새로운 패키지를 add하고,
2) 코드 내에서 using 키워드를 통해 패키지를 가져옵니다. 

이후 패키지의 사용은 `ThinkJulia.AAA()` / `ThinkJulia.BBB()`와 같이 사용할 수도 있고 ThinkJulia를 제외하고 `AAA()`, `BBB()`와 같이 사용할 수도 있습니다.
"""

# ╔═╡ 04a9d2b0-380f-4a2a-93ba-62e9dfb75614
md"""
ThinkJulia 패키지에는 그림을 그리는 거북이 기능이 내장되어 있습니다. 

아래 코드와 같이 거북이(Turtle)변수를 선언하고, 전방 100 픽셀 전진시키면 직선을 만들 수 있지요.
"""

# ╔═╡ c81467a5-0ffa-40b7-9b63-8a4a72538784
let
	@svg begin
		# 아래 두줄은 캔버스 사이즈를 조절하기 위한 설정으로 무시하고 지나가세요! 
		Drawing(500, 100)
		origin()

		# 여기서부터 집중하면 됩니다.
		🐢 = Turtle()
		forward(🐢, 100)
	end
end

# ╔═╡ 80310479-a138-425f-ba85-09e23981530d
md"""
거북이의 꼬리에 펜이 달려있고 거북이가 움직일 때마다 자취가 남는다고 생각하면 이해하기 쉽습니다.

거북이의 꼬리에 달린 펜을 들어올려 자취를 남기고 싶지 않다면 `penup()` 함수를 사용합니다. 자취를 다시 남기고 싶다면 `pendown()` 함수를 사용합니다.
"""

# ╔═╡ 79a596f0-e8b5-4976-b5ed-9eaeadd4bc62
let
	@svg begin
		Drawing(500, 100)
		origin()	
		🐢 = Turtle()
		forward(🐢, 100)
		penup(🐢)
		forward(🐢, 50)
		pendown(🐢)
		forward(🐢, 100)
	end
end

# ╔═╡ e434ea69-3653-4089-946d-293bcd10cd60
md"""
#### 4.1 단순 반복

"""

# ╔═╡ 0bf7e5ba-1fc3-45b9-9d09-fe287703ea59
md"""
이제부터 본격적으로 여러 예시들을 구현해보면서 Julia의 함수를 마스터해보고자 합니다.

그 전에, 거북이를 회전시키는 `turn()` 함수에 대해 알아보고, 예시 코드도 실행해 보겠습니다.
"""

# ╔═╡ 1370fe20-c4c3-43d4-a0a1-f8668b5d95a8
md"""
!!! notes
	**turn() 함수**
	- 첫번째 인자로 거북이 변수를 받는다.
	- 두번쨰 인자로 거북이가 회전하는 각도를 받는다.
	- 각도의 단위는 도(degree)이며, 시계방향이 (+)가 되는 좌표체계를 갖는다.  
"""

# ╔═╡ c9abdfde-8166-4fe0-a6ce-25b038913dac
let
	@svg begin
		Drawing(500, 300)
		origin()
		🐢 = Turtle()
		forward(🐢, 100)
		turn(🐢, -90)
		forward(🐢, 100)
	end
end

# ╔═╡ e8db1c9d-f2e9-4190-a9ff-fbfc18cbdf2f
md"""
### 연습 4-1
---
위 매크로를 수정해서 정사각형을 그려보세요. 

!!! warning
	다 하기 전까지는 더 읽지 마세요!
"""

# ╔═╡ a48b1136-16c4-42ac-9ab5-a1964f433e58
let
	@svg begin
		Drawing(500, 250)
		origin()
		🐢 = Turtle()
		for i in 1:4
			forward(🐢, 100)
			turn(🐢, -90)
		end
	end
end

# ╔═╡ ddb4c21e-2557-4208-bb25-4e6c662953f1
md"""
혹시 앞선 문제를 4번의 forward, turn 반복으로 구현하지 않았나요? 사실 `for` 명령문을 쓰면 이를 더 간결하게 할 수 있습니다.

for 반복문의 사용은 함수 정의와 유사하며 **for in (조건식)**과 **end** 키워드로 구성되어 있습니다. 일반적으로 N번의 반복되는 코드를 for-loop으로 간소화할 수 있으며, 아래와 같이 콜론(**:**) 키워드를 통해 특정 범위를 조건식으로 할당합니다.
"""

# ╔═╡ 3e66aa6e-7a56-4916-a306-f59e431ec933
begin
	for i in 1:10
		@show i
	end
end

# ╔═╡ 5b7d92dd-7a53-445d-b4b7-53ce4dc4b7d8
md"""
많이 사용되는 for-loop 예시로, String 변수 내 각 문자를 순회하거나, Array, Matrix과 같은 container type의 변수를 순회하는 코드를 작성해 보았습니다.

이때 주의할 점은, for 조건식에 사용한 변수명**(i, j, k 등)**과 같은 변수명이 for-loop안에서 사용된다는 것입니다.
"""

# ╔═╡ e6d53f14-e8c6-4916-9a31-4944d3b0d5cb
begin
	for i in "Hello"
		@show i
	end

	for k in [1.1, 2.2, 3.3, 4.4, 5.5]
		@show k
	end
end

# ╔═╡ 1dc3824a-2c5d-4107-88ce-a37681be90d4
md"""
### 연습 4-2
---
> 다음 연습 문제들은 모두 거북이를 이용합니다. 재미있기도 하지만, 배울 점을 하나씩 포함하 고 있습니다. 그게 어떤 것인지, 문제를 풀면서 생각해보세요.

!!! warning
	여기 문제들을 다 풀기 전까지는 다음 절을 읽지 마 세요(최소한 문제 풀이 시도라도 해보세요).
"""

# ╔═╡ a4ea0436-d7e6-4587-9d4d-cfb0a6242f67
md"""
* t를 매개변수로 하는 **square** 함수를 작성하세요. 여기서 t는 거북이입니다. 이 함수는 이 거북이를 이용해 정사각형을 그려야 합니다.
* 🐢를 인수로 하는 square 함수 호출을 작성하고, @svg 매크로가 이를 이용하도록 해보세요.
* square 함수에 매개변수 Len을 추가해보세요. 본문을 수정해서 변의 길이가 **Len**이 되도록 하는 것입니다. 함수 호출 시에도 두 번째 인수를 주도록 변경하고요. 이렇게 한 후 매크로를 다시 실행해보세요. Len의 값을 다르게 주면 어떻게 되는지 시험해보세요.
* square 함수를 복사하고 이름을 **polygon**으로 바꾸세요. 새로운 매개변수 n을 추가하고, n개의 변을 가지는 정다각형을 그리도록 본문을 수정해보세요.

!!! notes
	n개의 변을 가지는 정다각형의 외각은 $\frac{360}{\pi}$도입니다.

* 매개변수로 거북이 t, 반지름 r를 받는 함수 **circle**을 작성해보세요. 이 함수는 적당한 길이와 변의 개수를 인수로 해서 **polygon** 함수를 호출하고, 이를 통해 원 내지는 이에 근사한 도형 을 그려야 합니다. 여러 가지 r에 대해서 이 함수가 어떻게 동작하는지 시험해보세요.

!!! notes
	원의 둘레 circumference를 계산한 다음, len*n과 둘레가 같아지도록 하세요.

* circle 함수를 일반화해서 원호를 그리는 `arc` 함수를 작성해보세요. 그려야 할 원호의 각도를 나타내는 추가 매개변수 angle을 받아야 합니다. angle의 단위는 도(degree)입니다. (즉 angle 이 360으로 주어지면, arc 함수는 완전한 원을 그려야 합니다.)
"""

# ╔═╡ f12a4223-06cf-4893-bfcb-5adc4d0329cc
md"""
#### 4.2 캡슐화

"""

# ╔═╡ 19f90b03-5fad-4ae5-a21c-cc9c7d37ed1f
md"""
앞선 연습문제들 중 첫번째와 두번째에 대한 해답이 됩니다.

사각형을 그리며, 거북이를 매개변수로 받는 함수 `square()`를 작성해 보면 아래와 같습니다. 
"""

# ╔═╡ b8c93461-4397-4f5b-b3e1-d314a18b81f6
function square(t)
	for i in 1:4
		forward(t, 100)
		turn(t, -90)
	end
end

# ╔═╡ 0acbd8c7-e2c6-43c9-8b04-cc0ba110cf56
md"""
코드를 함수의 형태로 감싸는 것을 **캡슐화(Encapsulation)**라고 합니다.

캡슐화의 장점은 해당 코드를 얼마든지 재사용 할 수 있다는 것이지요. 아래와 같이 Turtle type의 새로운 변수, 🐫을 전달해도 동일하게 동작합니다.
"""

# ╔═╡ 1aef3eaf-5e3d-4118-9c34-3a08f7a821d4
md"""
#### 4.3 일반화
	
"""

# ╔═╡ c62dacb7-c108-40fc-85f4-1a086fa452db
md"""
다음 연습문제는 사각형의 변을 추가 매개변수로 갖는 함수를 작성하는 것이었지요. 함수에 매개변수를 추가하는 것을 **일반화(Generalization)**이라고 합니다. 

매개변수를 추가함으로 더욱 유연한 함수의 작성이 가능합니다. 함수를 호출하는 사용자가 스스로 선택할 수 있는 옵션이 많아지는 것이지요.
"""

# ╔═╡ 0c458c3b-fbbf-410e-8e03-cb61ee4702f1
function square(t, len)
    for i in 1:4
        forward(t, len)
        turn(t, -90)
    end
end

# ╔═╡ b7a5a931-be47-4ee0-823e-4480e14ceaaf
let
	🐢 = Turtle()
	@svg begin
		Drawing(500, 250)
		origin()

		square(🐢)
	end
end

# ╔═╡ 1d28b988-23fe-439c-a542-beb57a6bdb49
let
	🐫 = Turtle()
	@svg begin
		Drawing(500, 250)
		origin()

		square(🐫)
	end
end

# ╔═╡ 4f0da8b8-9fbf-426f-8913-090c077b1566
let
	🐢 = Turtle()
	@svg begin
		Drawing(500, 250)
		origin()
	    square(🐢, 100)
	end
end

# ╔═╡ 6b11e4d5-c3c5-42cd-877c-4ae448225dc2
md"""
n개의 변을 가지는 정다각형을 그리는 함수 `polygon`을 작성해 봅니다.  

이 또한 변의 개수와 변의 길이를 매개변수로 가짐으로 사용자에게 더 넓은 선택의 폭을 제공합니다.
"""

# ╔═╡ f46fa2f4-cd6f-476e-9ec3-e3ba4e8c5868
function polygon(t, n, len)
    angle = 360 / n
    for i in 1:n
        forward(t, len)
        turn(t, -angle)
    end
end

# ╔═╡ 43136185-5364-4551-b735-b37af51f2787
let
	🐢 = Turtle()
	@svg begin
		Drawing(500, 350)
		origin()
	    polygon(🐢, 7, 70)
	end
end

# ╔═╡ 1148a891-cc50-4bb4-8647-d8adaff0d7a7
md"""
#### 4.4 인터페이스 디자인
"""

# ╔═╡ ddb51c55-3a1b-4883-809e-ad2d2916af10
md"""
다음 문제는 반지름 r의 원을 그리는 것이었지요. 원의 둘레, 원주는 2πr이며, 원은 변이 매우 많은 정다각형이라 할 수 있으니 적절히 큰 수를 일전 polygon 함수의 n 대신 넣어주면 될 것입니다.
"""

# ╔═╡ e741b9f8-fbcc-43f2-9aa7-581874d141a6
function circle_old(t, r)
    circumference = 2 * π * r
    n = 50
    len = circumference / n
    polygon(t, n, len)
end

# ╔═╡ 6e9a5b67-6a44-4ba5-bcdd-5ef9048e4ed2
md"""
하지만 이렇게 함수를 작성하면 문제가 있습니다. 

한번, 매우 큰 반지름의 원을 그려보겠습니다.
"""

# ╔═╡ aa35213b-b4f1-48b4-b6f6-6cfea7ae9b03
let
	🐢 = Turtle()
	@svg begin
		Drawing(1000, 200)
		origin()
	    circle_old(🐢, 3000)
	end
end

# ╔═╡ 562fed34-cf75-4c5d-903d-b4d8f41ad8cf
md"""

!!! notes
	> 보이는 것과 같이 원의 겉부분이 매우 울퉁불퉁해지는 것을 볼 수 있습니다.

	이를 방지하기 위해 n을 더욱 키울 수 있습니다만... **얼마나 크게 해야 할까요?** 그리고 작은 원을 그릴 때면 쓸모없는 움직임이 발생할 텐데 이는 **어떻게 효율적으로 처리할 수 있을까요?**

직접 생각해본 뒤 아래의 코드를 살펴봅시다.
"""

# ╔═╡ c16316f2-a9f0-403f-bd14-2158e963ad86
function circle(t, r)
    circumference = 2 * π * r
    n = trunc(circumference / 3) + 3
    len = circumference / n
    polygon(t, n, len)
end

# ╔═╡ 289c9717-7596-4a97-bbf1-3a64b4ca5142
md"""
원의 둘레 길이에 따라 적절한 n을 사용하도록 코드를 작성하였습니다. 

원주 (circumference) / 3에 가까운 정수는 아무리 작아도 2 정도가 됩니다. 이정도 길이면 반지름이 아무리 작아도 원의 형태를 가질 수 있습니다. 3을 더해준 것은 적어도 변의 개수가 3개를 넘어야 하기 때문입니다. 
"""

# ╔═╡ 250e0673-7b1b-4068-a6d3-c102e64df619
let
	🐢 = Turtle()
	@svg begin
		Drawing(500, 200)
		origin()
	    circle(🐢, 40)
	end
end

# ╔═╡ e825f424-9cbb-4ee7-8e0f-fb0efff76553
md"""
#### 4.5 리펙터링
"""

# ╔═╡ 54ca139e-b8a6-446e-8a02-5b5624f9bed8
md"""
원호를 그리는 `arc` 함수를 구현해보고자 합니다. 이전 circle 함수는 원을 그리는 것이 변이 매우 많은 정다각형을 그리는 것과 동일하기에 **`ploygon` 함수를 재사용함으로** 손쉽게 구현할 수 있었지만 이번 arc는 좀 다릅니다.
"""

# ╔═╡ a98faf9e-9e4b-454a-83fa-60cd1e3962ef
function arc(t, r, angle)
	# arc(원호)는 원주의 일부를 의미하고 일정 각도만큼의 원주의 일부가 됩니다.
    arc_len = 2 * π * r * angle / 360
	# 이 부분부터 cirle, polygon과 매우 유사합니다.
    n = trunc(arc_len / 3) + 1
    step_len = arc_len / n
    step_angle = angle / n
    for i in 1:n
        forward(t, step_len)
        turn(t, -step_angle)
    end
end

# ╔═╡ 339e1abc-f2e6-46a1-925b-399ad77df9aa
md"""
코드 주석에서 보시다시피 대부분의 코드는 일전 circle, polygon과 유사하고 angle이라는 변수가 추가됨으로 변경되는 부분이 생겼습니다.

이 시점에서 **일전 ploygon 함수와 유사하지만, 주어진 특정 각도만큼 반복 회전하는 함수를 만들게 될 시, 코드의 재사용성이 더 좋아지지 않을까** 생각해보셨을까요? 
"""

# ╔═╡ 2d8cc0eb-fcfc-4f1e-8a89-f99355160eaf
function polyline(t, n, len, angle)
    for i in 1:n
        forward(t, len)
        turn(t, -angle)
    end
end

# ╔═╡ 01aacb3d-a725-4291-9580-dc868c245a32
function polygon_new(t, n, len)
    angle = 360 / n
    polyline(t, n, len, angle)
end


# ╔═╡ d24190c4-a9f3-497c-a7ad-7c3f57058bf6
function arc_new(t, r, angle)
    arc_len = 2 * π * r * angle / 360
    n = trunc(arc_len / 3) + 1
    step_len = arc_len / n
    step_angle = angle / n
    polyline(t, n, step_len, step_angle)
end

# ╔═╡ fca9750c-b800-4ba6-a73b-3b13822caada
let
	🐢 = Turtle()
	@svg begin
		Drawing(500, 200)
		origin()
	    arc_new(🐢, 40, 120)
	end
end

# ╔═╡ d5e751ba-5f76-4868-9101-8d43192bf645
md"""
이렇게 인터페이스를 개선하고 코드의 효율성을 높이는 방향으로 코드 전체를 재정비하는 과정을 **Refactoring**이라고 이야기합니다. 우리의 경우 arc와 polygon함수 사이 재활용성을 높이기 위해 polygon과 유사한 ployline을 구현했지요.
"""

# ╔═╡ e225b3ba-8ba2-4610-b6be-ad29a6200999
md"""
!!! notes
	Refactoring은 코딩을 시작한 이후, 시스템이 복잡해지고 얽히게 되면서 비로소 문제점을 파악하고 개선점을 생각할 수 있습니다. 따라서 코드를 작성하기 전부터 너무 복잡하게 생각하지 마세요!!
"""

# ╔═╡ 6a8971ad-2880-4ead-bd93-1b8f72f9076e
md"""
#### 4.6 Docstring
"""

# ╔═╡ 340eb1f6-ba82-4075-bee6-ab12a18bba24
md"""
여러분들이 열심히 구현한 코드에 대해서 **설명**이 없다면, 다른 사람들이 보기에 심지어 미래의 자신이 보기에도 무척 어렵습니다. 따라서, 구현한 인터페이스에 대해 개발자가 간결한 설명을 적어두는 것을 docstring이라고 합니다.

Julia의 docstring은 보통 함수 바로 앞 삼중 문자열(\"\"\")안에 적어둡니다. 함수에 대한 간단한 설명과 더불어 매개변수, Retrun 값에 대해서도 적어둡니다.
"""

# ╔═╡ 2c5cd3d3-0e6b-4741-a664-086821b3abde
"""
polyline(t, n, len, angle)

Draws n line segments with the given length and
angle (in degrees) between them.  t is a turtle.
"""
function polyline_docs_ver(t, n, len, angle)
    for i in 1:n
        forward(t, len)
        turn(t, -angle)
    end
end

# ╔═╡ 3ce5d7b0-1312-4be9-9758-289481f41917
md"""
!!! notes
	docstring을 확인하는 방법은 `@doc + <함수 이름>`으로 조회하거나 Julia 터미널 상에서 물음표(?)를 입력하면 됩니다.
"""

# ╔═╡ 302fe9a0-dd84-4cda-9d11-353339f46644
@doc polyline_docs_ver

# ╔═╡ fb2d9c76-23a0-4b8f-9094-75d09205c2dc
md"""
> 우리가 가장 처음 작성했던 println 함수도 아래와 같이 친절한 docstring을 제공하고 있습니다.
"""

# ╔═╡ 2b6573a4-26c2-43db-9d49-e565bf5b77ea
@doc println

# ╔═╡ ef541887-5c24-4f02-9417-08ef45f26bff
md"""
### 연습 4-3
---
일전의 arc 함수는 원호의 선형 근사가 항상 진짜 원의 바깥쪽에 있기 때문에 약간 정확도가 떨어집니다. 그 결과로 실행이 끝났을 때 거북이는 제대로 된 목적지에서 몇 픽셀 벗어난 위치에 있게 됩니다. 

여기서 이런 오류의 효과를 감소시킬 수 있는 방법을 보여드릴 것입니다. 코드를 읽고, 이해가 되는지 확인해보세요. 그림을 그려서 확인해보면, 왜 이렇게 되는지 이해할 수 있을 겁니다.

```julia
\"\"\"
	arc(t, r, angle)
	주어진 반지름과 각도를 이용해 원호를 그린다.
	t: 거북이
	r: 반지름
	angle: 중심각 (단위는 도)
\"\"\"

function arc(t, r, angle)
	arc_len = 2* * * abs(angle)/360
	n = trunc(arc_len/4) + 3
	step_len = arc_len/n
	step_angle = angle/n
	#원호의 선형 근사로 인해 발생하는 오차를 줄이기 위해서
	#시작하기 전에 살짝 왼쪽으로 회전시킨다
	turn(t, -step_angle/2)
	polyline(t, n, step_len, step_angle)
	turn(t, step_angle/2)
end
```
"""

# ╔═╡ 63718161-8ea7-4c97-a2c5-c5cec690bae5
md"""
### 연습 4-4
---
꽃과 같은 도형을 그릴 수 있는 함수를 작성해보고 Refactoring도 해보세요.

![image](https://github.com/kimsooyoung/optimal_control_julia/assets/12381733/a2af7502-ba18-4633-96f2-6b89231143e1)

"""

# ╔═╡ 0c74f2fd-cc9b-43db-bfe9-4ca186750f70
md"""
### 연습 4-5
---
아래와 같은 도형을 그릴 수 있는 함수를 작성해보고 Refactoring도 해보세요.

![image](https://github.com/kimsooyoung/optimal_control_julia/assets/12381733/9b59d4c9-f6a6-4139-af7e-1f6c34ce1347)
"""

# ╔═╡ 0f1a6921-d6e8-44da-bed8-94fbb3178dee
md"""
### 연습 4-6
---
알파벳의 각 문자들은 수직선, 수평선, 곡선 등 기본 요소 몇 개를 조합해서 그릴 수 있습니다.
최소 개수의 기본 요소로 그릴 수 있는 알파벳을 디자인한 후, 실제로 그 문자들을 그리는 함수 를 작성하세요.
> 각 문자마다 그것을 그리는 함수가 따로 있어야 합니다. 함수 이름은 draw_a, draw_b와 같은 식으로 하고, `letters.jl` 파일에 집어넣으세요.
"""

# ╔═╡ 82c1b2af-54e8-40d8-8f8f-eb263aae4e3b
md"""
### 연습 4-7
---
위키백과에서 와선, spiral 항목([https://ko.wikipedia.org/wiki/와선](https://ko.wikipedia.org/wiki/와선))을 읽고, 그림과 같이 아르키메데스 와선을 그리는 프로그램을 작성하세요.

![image](https://github.com/kimsooyoung/optimal_control_julia/assets/12381733/52e85913-1f63-4d6c-99c7-3d613bd85216)
"""

# ╔═╡ Cell order:
# ╟─2a0ec542-f284-11ee-3c0b-6b17b56aeaa8
# ╟─796d4c0c-09fd-4841-bf90-063e593ecadc
# ╟─4046af5b-eb09-4eb7-a4f1-70bec4b7e057
# ╠═4b826b26-811e-4087-9f0f-a1c6336ba741
# ╟─f49b22e1-e985-46e5-9a0f-20c93a178eb5
# ╠═fe8ac563-cf71-4091-a302-10ad102fda7c
# ╟─04a9d2b0-380f-4a2a-93ba-62e9dfb75614
# ╠═c81467a5-0ffa-40b7-9b63-8a4a72538784
# ╟─80310479-a138-425f-ba85-09e23981530d
# ╠═79a596f0-e8b5-4976-b5ed-9eaeadd4bc62
# ╟─e434ea69-3653-4089-946d-293bcd10cd60
# ╟─0bf7e5ba-1fc3-45b9-9d09-fe287703ea59
# ╟─1370fe20-c4c3-43d4-a0a1-f8668b5d95a8
# ╠═c9abdfde-8166-4fe0-a6ce-25b038913dac
# ╟─e8db1c9d-f2e9-4190-a9ff-fbfc18cbdf2f
# ╠═a48b1136-16c4-42ac-9ab5-a1964f433e58
# ╟─ddb4c21e-2557-4208-bb25-4e6c662953f1
# ╠═3e66aa6e-7a56-4916-a306-f59e431ec933
# ╟─5b7d92dd-7a53-445d-b4b7-53ce4dc4b7d8
# ╠═e6d53f14-e8c6-4916-9a31-4944d3b0d5cb
# ╟─1dc3824a-2c5d-4107-88ce-a37681be90d4
# ╟─a4ea0436-d7e6-4587-9d4d-cfb0a6242f67
# ╟─f12a4223-06cf-4893-bfcb-5adc4d0329cc
# ╟─19f90b03-5fad-4ae5-a21c-cc9c7d37ed1f
# ╠═b8c93461-4397-4f5b-b3e1-d314a18b81f6
# ╠═b7a5a931-be47-4ee0-823e-4480e14ceaaf
# ╟─0acbd8c7-e2c6-43c9-8b04-cc0ba110cf56
# ╠═1d28b988-23fe-439c-a542-beb57a6bdb49
# ╟─1aef3eaf-5e3d-4118-9c34-3a08f7a821d4
# ╟─c62dacb7-c108-40fc-85f4-1a086fa452db
# ╠═0c458c3b-fbbf-410e-8e03-cb61ee4702f1
# ╠═4f0da8b8-9fbf-426f-8913-090c077b1566
# ╟─6b11e4d5-c3c5-42cd-877c-4ae448225dc2
# ╠═f46fa2f4-cd6f-476e-9ec3-e3ba4e8c5868
# ╠═43136185-5364-4551-b735-b37af51f2787
# ╟─1148a891-cc50-4bb4-8647-d8adaff0d7a7
# ╟─ddb51c55-3a1b-4883-809e-ad2d2916af10
# ╠═e741b9f8-fbcc-43f2-9aa7-581874d141a6
# ╟─6e9a5b67-6a44-4ba5-bcdd-5ef9048e4ed2
# ╠═aa35213b-b4f1-48b4-b6f6-6cfea7ae9b03
# ╟─562fed34-cf75-4c5d-903d-b4d8f41ad8cf
# ╠═c16316f2-a9f0-403f-bd14-2158e963ad86
# ╟─289c9717-7596-4a97-bbf1-3a64b4ca5142
# ╠═250e0673-7b1b-4068-a6d3-c102e64df619
# ╟─e825f424-9cbb-4ee7-8e0f-fb0efff76553
# ╟─54ca139e-b8a6-446e-8a02-5b5624f9bed8
# ╠═a98faf9e-9e4b-454a-83fa-60cd1e3962ef
# ╟─339e1abc-f2e6-46a1-925b-399ad77df9aa
# ╠═2d8cc0eb-fcfc-4f1e-8a89-f99355160eaf
# ╠═01aacb3d-a725-4291-9580-dc868c245a32
# ╠═d24190c4-a9f3-497c-a7ad-7c3f57058bf6
# ╠═fca9750c-b800-4ba6-a73b-3b13822caada
# ╟─d5e751ba-5f76-4868-9101-8d43192bf645
# ╟─e225b3ba-8ba2-4610-b6be-ad29a6200999
# ╟─6a8971ad-2880-4ead-bd93-1b8f72f9076e
# ╟─340eb1f6-ba82-4075-bee6-ab12a18bba24
# ╠═2c5cd3d3-0e6b-4741-a664-086821b3abde
# ╟─3ce5d7b0-1312-4be9-9758-289481f41917
# ╠═302fe9a0-dd84-4cda-9d11-353339f46644
# ╟─fb2d9c76-23a0-4b8f-9094-75d09205c2dc
# ╠═2b6573a4-26c2-43db-9d49-e565bf5b77ea
# ╟─ef541887-5c24-4f02-9417-08ef45f26bff
# ╟─63718161-8ea7-4c97-a2c5-c5cec690bae5
# ╟─0c74f2fd-cc9b-43db-bfe9-4ca186750f70
# ╟─0f1a6921-d6e8-44da-bed8-94fbb3178dee
# ╟─82c1b2af-54e8-40d8-8f8f-eb263aae4e3b
