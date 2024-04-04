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

흥미로운 예시를 통해 Julia의 함수들을 어떻게 설계하는지 알아보겠습니다.
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

# ╔═╡ dca03ee8-8e9c-45f2-b293-aa3b43c21328
md"""
아래 코드 가려놓기
"""

# ╔═╡ a48b1136-16c4-42ac-9ab5-a1964f433e58
let
	@svg begin
		Drawing(500, 300)
		origin()
		🐢 = Turtle()
		for i in 1:4
			forward(🐢, 100)
			turn(🐢, -90)
		end
	end
end

# ╔═╡ f12a4223-06cf-4893-bfcb-5adc4d0329cc
md"""
#### 4.2 캡슐화

"""

# ╔═╡ b7a5a931-be47-4ee0-823e-4480e14ceaaf
begin 
	@svg begin
		Drawing(600, 400, "./turtles.png")
		origin()
		background("midnightblue")
		🐢 = Turtle() # you can type the turtle emoji with \:turtle:
		Pencolor(🐢, "cyan")
		Penwidth(🐢, 1.5)
		n = 5
		for i in 1:400
		    global n
		    Forward(🐢, n)
		    Turn(🐢, 89.5)
		    HueShift(🐢)
		    n += 0.75
		end
		fontsize(20)
		Message(🐢, "finished")
		finish()
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
# ╟─dca03ee8-8e9c-45f2-b293-aa3b43c21328
# ╠═a48b1136-16c4-42ac-9ab5-a1964f433e58
# ╟─f12a4223-06cf-4893-bfcb-5adc4d0329cc
# ╠═b7a5a931-be47-4ee0-823e-4480e14ceaaf
