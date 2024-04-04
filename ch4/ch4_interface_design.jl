### A Pluto.jl notebook ###
# v0.19.40

using Markdown
using InteractiveUtils

# ╔═╡ 4b826b26-811e-4087-9f0f-a1c6336ba741
import Pkg; Pkg.add(url="https://github.com/BenLauwens/ThinkJulia.jl")

# ╔═╡ fe8ac563-cf71-4091-a302-10ad102fda7c
using ThinkJulia

# ╔═╡ 2a0ec542-f284-11ee-3c0b-6b17b56aeaa8
md"""
# Sooyoung Kim's Think Julia 

![image](https://github.com/kimsooyoung/ThinkJulia/assets/12381733/260603e2-20ed-428e-b15b-0381f73fb46c)
"""

# ╔═╡ 796d4c0c-09fd-4841-bf90-063e593ecadc
md"""
## Case study - Interface Design

흥미로운 예시(🐢)를 통해 Julia의 함수들을 어떻게 설계하는지 알아보겠습니다.
"""

# ╔═╡ 4046af5b-eb09-4eb7-a4f1-70bec4b7e057
md"""
!!! warning
	이번 챕터를 위해 새로운 패키지를 추가로 설치하고, 사용하고자 합니다. 아래의 Cell을 실행해야 앞으로의 모든 예시들을 실행 가능하니 꼭 짚고 넘어가주세요!
"""

# ╔═╡ c81467a5-0ffa-40b7-9b63-8a4a72538784
let
	@svg begin
		🐢 = Turtle()
		forward(🐢, 100)
	end
end

# ╔═╡ 79a596f0-e8b5-4976-b5ed-9eaeadd4bc62
let
	@svg begin
		🐢 = Turtle()
		forward(🐢, 100)
		penup(🐢)
		forward(🐢, 50)
		pendown(🐢)
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
		🐢 = Turtle()
		forward(🐢, 100)
		penup(🐢)
		forward(🐢, 50)
		pendown(🐢)
		forward(🐢, 100)
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
# ╟─e8db1c9d-f2e9-4190-a9ff-fbfc18cbdf2f
# ╟─dca03ee8-8e9c-45f2-b293-aa3b43c21328
# ╠═a48b1136-16c4-42ac-9ab5-a1964f433e58
