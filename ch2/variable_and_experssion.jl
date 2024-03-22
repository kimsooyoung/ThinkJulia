### A Pluto.jl notebook ###
# v0.19.40

using Markdown
using InteractiveUtils

# ╔═╡ d9d9bba0-e835-11ee-0ab1-8b3a618e2ecf
md"""
# Sooyoung Kim's Think Julia 

![image](https://github.com/kimsooyoung/ThinkJulia/assets/12381733/260603e2-20ed-428e-b15b-0381f73fb46c)
"""

# ╔═╡ 67942e08-ee84-4149-b0de-31e5b6d31293
md"""
## Variable and Experssion

지난 시간에 이어 계속해서 Julia의 기초에 대해 알아보겠습니다.
"""

# ╔═╡ d3c769af-b108-482c-ada7-d30dcd8d2f71
md"""
#### 2.1 스크립트 모드
"""

# ╔═╡ 05f15850-53f9-41ea-a8f3-6656c7fce4c9
md"""
```
5
x = 5
x + 1
```
"""

# ╔═╡ 110d9178-dae6-4566-80a2-39342c718e03
md"""
#### 2.2 연산자 우선순위
"""

# ╔═╡ 07068b7a-0cd8-4360-819a-44886ec17ab0
begin 
	@show 2*(3-1)
	@show (1+1)^(5-2)
end

# ╔═╡ de0a8b8a-696e-4921-bb22-ce2e2c1edbed
begin
	@show 1+2^3
	@show 2*3^2
end

# ╔═╡ 1eb32a8c-c3be-4e1b-9ee1-95f243448248
begin
	@show 2*3-1
	@show 6+4/2
end

# ╔═╡ cace0ca1-e72e-4c09-8bcf-0cd737c2bafc
begin
	x = 5
	@show 2x
end

# ╔═╡ 2e29fa87-29e8-4d88-a33b-afd0081d8f32
md"""
#### 2.3 문자열 연산자
"""

# ╔═╡ 9030edf3-d4b4-46e8-a8ab-02e9dd281709
"2" - "1"
"three" + "two"
"four" / "one"

# ╔═╡ cac47b70-fcd1-41b6-9732-2d16b937f4e4
begin
	@show "first word " * "second word"
	@show "Spam " ^ 3
end

# ╔═╡ 96b3968e-c719-4ad4-b25c-f381cae9dd94
md"""
### 연습 2-2
---
> 2장에서 새롭게 배운 기능에 대해 대화형 모드에서 의도적으로 오류를 발생시키고, 어떻게 잘못되는지 확인해보세요.
1. `n = 42`가 맞는 문장인 것은 알고 있습니다. 42 = n은 어떻습니까?
2. `x = y = 1`은 어떻습니까?
3. 어떤 프로그래밍 언어에서는 모든 문장이 세미콜론, 즉 `;` 기호가 붙어서 끝납니다. 줄리 아의 문장 맨 마지막에 세미콜론을 붙이면 어떻게 되나요?
4. 문장의 마지막에 마침표를 넣으면요?
5. 수학에서는 x와 y를 곱할 때, xy처럼 연산자를 생략할 수 있습니다. 줄리아에서도 그렇 게 될까요? `5x`는 어떻습니까?
"""

# ╔═╡ 966e05f2-e6ae-4b9e-888f-70cfb6948c5b
md"""
### 연습 2-3
---
> 줄리아 REPL을 실행해서 계산기로 써봅시다.
1. 반지름이 r인 구의 부피는 1입니다. 반지름이 5인 구의 부피는 얼마인가요?
2. 어떤 책의 정가가 `$24.95`인데, 서점에서 `40%` 할인을 해줍니다. 배송비는 한 권일 때 $3 이고, 한 권이 늘어날 때마다 75센트가 붙습니다. 60권을 주문 및 배송한다면 얼마의 비 용이 들까요?
3. 제가 아침 6시 52분에 집을 떠나서, 1마일을 느긋하게 달리고 (1마일당 8분 15초), 3마 일을 조금 빠르게 달리고 (1마일당 7분 12초), 다시 1마일을 느긋하게 달린다면, 언제 집 에 도착하겠습니까?
"""

# ╔═╡ Cell order:
# ╟─d9d9bba0-e835-11ee-0ab1-8b3a618e2ecf
# ╟─67942e08-ee84-4149-b0de-31e5b6d31293
# ╠═d3c769af-b108-482c-ada7-d30dcd8d2f71
# ╟─05f15850-53f9-41ea-a8f3-6656c7fce4c9
# ╟─110d9178-dae6-4566-80a2-39342c718e03
# ╠═07068b7a-0cd8-4360-819a-44886ec17ab0
# ╠═de0a8b8a-696e-4921-bb22-ce2e2c1edbed
# ╠═1eb32a8c-c3be-4e1b-9ee1-95f243448248
# ╠═cace0ca1-e72e-4c09-8bcf-0cd737c2bafc
# ╟─2e29fa87-29e8-4d88-a33b-afd0081d8f32
# ╠═9030edf3-d4b4-46e8-a8ab-02e9dd281709
# ╠═cac47b70-fcd1-41b6-9732-2d16b937f4e4
# ╟─96b3968e-c719-4ad4-b25c-f381cae9dd94
# ╟─966e05f2-e6ae-4b9e-888f-70cfb6948c5b
