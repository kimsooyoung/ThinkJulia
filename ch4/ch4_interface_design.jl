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

> 흥미로운 예시를 통해 Julia의 함수들을 어떻게 설계하는지 알아보겠습니다.
![luxor](https://github.com/kimsooyoung/ThinkJulia/assets/12381733/82f5e105-fba4-4640-ae1c-e614939c536b)
"""

# ╔═╡ 4046af5b-eb09-4eb7-a4f1-70bec4b7e057
md"""
!!! warning
	이번 챕터를 위해 새로운 패키지를 추가로 설치하고, 사용하고자 합니다. 아래의 Cell을 실행해야 앞으로의 모든 예시들을 실행 가능하니 꼭 짚고 넘어가주세요!
"""

# ╔═╡ c81467a5-0ffa-40b7-9b63-8a4a72538784
let
	@svg begin
		Drawing(500, 100)
		origin()
		🐢 = Turtle()
		forward(🐢, 100)
	end
end

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
> 위 매크로를 수정해서 정사각형을 그려보세요. 다 하기 전까지는 더 읽지 마세요!
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

# ╔═╡ f12a4223-06cf-4893-bfcb-5adc4d0329cc
md"""
#### 4.2 캡슐화

"""

# ╔═╡ b8c93461-4397-4f5b-b3e1-d314a18b81f6
function square(t)
	for i in 1:4
		forward(t, 100)
		turn(t, -90)
	end
end

# ╔═╡ 1aef3eaf-5e3d-4118-9c34-3a08f7a821d4
md"""
#### 4.3 일반화
	
"""

# ╔═╡ c62dacb7-c108-40fc-85f4-1a086fa452db
md"""
함수에 매개변수를 추가하는 것을 일반화(Generalization)이라고 합니다. 
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

# ╔═╡ e741b9f8-fbcc-43f2-9aa7-581874d141a6
function circle_old(t, r)
    circumference = 2 * π * r
    n = 50
    len = circumference / n
    polygon(t, n, len)
end

# ╔═╡ c16316f2-a9f0-403f-bd14-2158e963ad86
function circle(t, r)
    circumference = 2 * π * r
    n = trunc(circumference / 3) + 3
    len = circumference / n
    polygon(t, n, len)
end

# ╔═╡ 250e0673-7b1b-4068-a6d3-c102e64df619
let
	🐢 = Turtle()
	@svg begin
		Drawing(500, 250)
		origin()
	    circle(🐢, 40)
	end
end

# ╔═╡ Cell order:
# ╟─2a0ec542-f284-11ee-3c0b-6b17b56aeaa8
# ╟─796d4c0c-09fd-4841-bf90-063e593ecadc
# ╟─4046af5b-eb09-4eb7-a4f1-70bec4b7e057
# ╠═4b826b26-811e-4087-9f0f-a1c6336ba741
# ╠═fe8ac563-cf71-4091-a302-10ad102fda7c
# ╠═c81467a5-0ffa-40b7-9b63-8a4a72538784
# ╠═79a596f0-e8b5-4976-b5ed-9eaeadd4bc62
# ╟─e434ea69-3653-4089-946d-293bcd10cd60
# ╠═c9abdfde-8166-4fe0-a6ce-25b038913dac
# ╟─e8db1c9d-f2e9-4190-a9ff-fbfc18cbdf2f
# ╠═a48b1136-16c4-42ac-9ab5-a1964f433e58
# ╟─ddb4c21e-2557-4208-bb25-4e6c662953f1
# ╠═3e66aa6e-7a56-4916-a306-f59e431ec933
# ╟─5b7d92dd-7a53-445d-b4b7-53ce4dc4b7d8
# ╠═e6d53f14-e8c6-4916-9a31-4944d3b0d5cb
# ╟─f12a4223-06cf-4893-bfcb-5adc4d0329cc
# ╠═b8c93461-4397-4f5b-b3e1-d314a18b81f6
# ╠═b7a5a931-be47-4ee0-823e-4480e14ceaaf
# ╠═1d28b988-23fe-439c-a542-beb57a6bdb49
# ╟─1aef3eaf-5e3d-4118-9c34-3a08f7a821d4
# ╠═c62dacb7-c108-40fc-85f4-1a086fa452db
# ╠═0c458c3b-fbbf-410e-8e03-cb61ee4702f1
# ╠═4f0da8b8-9fbf-426f-8913-090c077b1566
# ╠═f46fa2f4-cd6f-476e-9ec3-e3ba4e8c5868
# ╠═43136185-5364-4551-b735-b37af51f2787
# ╠═1148a891-cc50-4bb4-8647-d8adaff0d7a7
# ╠═e741b9f8-fbcc-43f2-9aa7-581874d141a6
# ╠═c16316f2-a9f0-403f-bd14-2158e963ad86
# ╠═250e0673-7b1b-4068-a6d3-c102e64df619
