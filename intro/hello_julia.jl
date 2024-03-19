### A Pluto.jl notebook ###
# v0.19.40

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

# ╔═╡ 6bd9e64f-a849-4cf1-89cb-17f30b731ac1
using PlutoUI

# ╔═╡ aad83a92-e478-11ee-1571-1b43c9076e2b
using Markdown

# ╔═╡ b6fcd007-f95d-44a3-aab2-847539906989
md"""
# Sooyoung Kim's Think Julia 
"""

# ╔═╡ ffdb0041-ef7d-4350-b7d3-d60896ef2806
md"""
![image](https://github.com/kimsooyoung/ThinkJulia/assets/12381733/260603e2-20ed-428e-b15b-0381f73fb46c)
"""

# ╔═╡ eee61157-8ec4-4dd9-b633-ef57ae703dbf
md"""
## 😊 안녕하세요 여러분! 

Julia 언어를 배우고자 여기에 오셨으리라 생각합니다. 저의 강의를 시작하기 전 원활한 코드 실습 및 강의 진행을 위해, Julia Programming의 특성과 지금 보고 계신 [Pluto](https://plutojl.org/)에 대해서 간단히 소개하고자 합니다.
"""

# ╔═╡ 36589151-5910-43e9-bbd6-daf63f84aace
md"""
# 1. [지속 업데이트 예정]  Julia 특징 
"""

# ╔═╡ 7e81e697-5402-4db8-9200-6980c91fe7b4
md"""
Julia는 Python, C/C++, Java와 달리 그리고 Matlab과 동일하게 배열의 index가 1에서 부터 시작합니다.
"""

# ╔═╡ 7955baf0-d9e5-4c51-a613-26531b7b1582
begin
	a = [ 1, 2, 3, 4 ]
	print("first element of a is $(a[1])")
end

# ╔═╡ 664e4fbc-7d9f-41c2-a898-189b57a9a64e
md"""
더불어, Julia에서는 "배열"이라는 표현보다 Vector라고 표현합니다. (이는 후에 다시 한 번 자세히 다루어보겠습니다.)
"""

# ╔═╡ 08bb23cc-e961-4ee5-a8f3-a9f7889a7c93
@show typeof(a)

# ╔═╡ 73834e48-0fcc-4f1c-b668-19f9a70a4e8e
md"""
Julia의 또다른 유요한 특징, α, β, γ, λ, ∇, Δ 와 같은 수학 기호들을 변수명에 사용할 수 있습니다. Julia 자체가 Scientific Computing을 위해 개발되었기 때문이지 않을까 합니다 :)
"""

# ╔═╡ 82c499b6-4c1e-4df9-a51a-f141e63d695e
begin
	x = rand(Int, 2)
	fₓ = 2*x.^3 - x.^2 + 3*x
	∂fₓ = 6*x.^2 - 2*x .+ 3
end

# ╔═╡ 00610321-660a-4499-800b-d22498378a4e
md"""
# 2. Pluto 사용 시 주의점 
"""

# ╔═╡ e8c37d0b-9331-4bbd-a503-66e246eb1575
md"""
지금 보고 계신 이 화면이 바로 Pluto입니다. Pluto는 Cell 단위로 Julia 코드를 실행할 수 있어 교육용으로 사용하기에 매우 훌륭하며, 비슷한 Jupyter Notebook / Jupyter Lab과 비교하면, Interactive하다는 큰 차이를 갖고 있습니다. 

> 여기에서 interactive 하다는 것의 의미에 대해서 직접 코드를 실행하며 알아봅시다.

!!! note "실습해보기"
    아래에 등장하는 두 슬라이더를 이동시키면서 slide_sum의 값이 어떻게 변화하는지 살펴보세요!

"""

# ╔═╡ c53cd944-a579-40c0-964d-a60939a8fe6c
@bind slide_a Slider(1.0:0.1:10.0; show_value=true)

# ╔═╡ 4dfca376-6653-472d-9f45-871a87aece96
@bind slide_b Slider(1.0:0.1:10.0; show_value=true)

# ╔═╡ 44db1a73-1854-4b09-9993-b9c4cb8d52f3
slide_sum = slide_a + slide_b

# ╔═╡ 3ae988d2-4817-454a-afdd-c06c3bd42ec4
md"""
!!! correct "실습 결과"
	`slide_sum`의 결과가 동적으로 변화하는 것을 알 수 있습니다! 

이는 같은 Pluto Notebook에서 선언된 변수는 모두 그 값이 공유되기 떄문입니다. 

이것이 편할 때도 있지만, 개발 중 이전에 선언한 변수를 다시 참조하고자 할 시 다소 불편할 수 있는데요. 이럴 때는 **local 변수**를 사용하면 보다 용이합니다.
"""

# ╔═╡ 36e8507a-383f-4fa1-aa8e-572b6c187264
md"""
## Local variable from Pluto #1
"""

# ╔═╡ 0fd64492-7cc3-421a-8448-862dcdcf49c6
let
	x = "Sooyoung"
	println("Hello $(x) 😁")
end

# ╔═╡ 3049f012-1d05-4632-8554-b506e7afb792
let
	x = "Juwon"
	println("Hello $(x) 😁")
end

# ╔═╡ 770f61d5-d449-45fc-88ef-eab7543701dd
md"""
## Local variable from Pluto #2
"""

# ╔═╡ de9d12cf-adce-478e-9c31-8159adadde5e
begin
	local x = "Sooyoung"
	println("Hello $(x) 😁")
end

# ╔═╡ 5b38e0d4-e873-4341-b8ba-aadc3b5538de
begin
	local x = "Juwon"
	println("Hello $(x) 😁")
end

# ╔═╡ 7c39978f-29c8-4072-bfc5-b1bf678f9e63
md"""
# 3. Pluto와 Markdown 
"""

# ╔═╡ 20a83e7a-ffc8-46f0-928c-db5fc87ad672
md"""
다음으로, Pluto에서 Markdown을 사용할 시 유용한 몇가지 팁을 알려드리고자 합니다.  

첫째로, Pluto에서 md\"\"\" \"\"\"로 감싸진 부분은 자동으로 markdown으로 인식됩니다.
"""

# ╔═╡ 4b7ecf4e-144c-4ddd-a3ee-8592ecd3eea5
md"""
	이 안은 Markdown이 되는 것이지요 
"""

# ╔═╡ 1d5b55f7-8a93-4bff-a568-2b283bab75ad

md"""
!!! note
	Cell 안에서 `ctrl + m` 키를 사용하면 손쉽게 markdown cell로 바꿀 수 있습니다. 
"""

# ╔═╡ 55c8b291-3736-4fc7-9ebf-e3028ce3d939
md"""
바로 위에 있는 예쁜 모양의 블럭은 **"admonitions"**이라고 불리며 이는 Markdown package를 사용하여 아래와 같이 사용할 수 있습니다.
"""

# ╔═╡ 35a317c3-73bf-4e31-ad28-a27bae74eec5
md"""
!!! note
    Note text goes here.
"""

# ╔═╡ f3d0a879-06cc-47a2-a791-9696def524d7
md"""
파란색의 note block 뿐만 아니라 아래와 같은 여러 block들도 제공하고 있습니다.
"""

# ╔═╡ a1f9a786-708b-4444-9290-77838bd8336d
md"""
!!! warning "This is a warning"
    my message

!!! hint "Move your cursor onto this cell"
    my message

!!! correct "Great Job!"
    my message

!!! danger "⚠️ Caution ⚠️"
    my message
"""

# ╔═╡ b3a2b8cd-06bd-4ae1-aeda-b226ab6f1bf6
md"""
### **⇒ 그럼, 다음 1강에서 본격적으로 Julia에 대해 살펴보겠습니다. Stay Tuned! 😁😁**
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Markdown = "d6f4376e-aef5-505a-96c1-9c027394607a"
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
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

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
# ╟─b6fcd007-f95d-44a3-aab2-847539906989
# ╟─ffdb0041-ef7d-4350-b7d3-d60896ef2806
# ╟─eee61157-8ec4-4dd9-b633-ef57ae703dbf
# ╟─36589151-5910-43e9-bbd6-daf63f84aace
# ╟─7e81e697-5402-4db8-9200-6980c91fe7b4
# ╠═7955baf0-d9e5-4c51-a613-26531b7b1582
# ╟─664e4fbc-7d9f-41c2-a898-189b57a9a64e
# ╠═08bb23cc-e961-4ee5-a8f3-a9f7889a7c93
# ╟─73834e48-0fcc-4f1c-b668-19f9a70a4e8e
# ╠═82c499b6-4c1e-4df9-a51a-f141e63d695e
# ╟─00610321-660a-4499-800b-d22498378a4e
# ╟─e8c37d0b-9331-4bbd-a503-66e246eb1575
# ╠═6bd9e64f-a849-4cf1-89cb-17f30b731ac1
# ╠═c53cd944-a579-40c0-964d-a60939a8fe6c
# ╠═4dfca376-6653-472d-9f45-871a87aece96
# ╠═44db1a73-1854-4b09-9993-b9c4cb8d52f3
# ╟─3ae988d2-4817-454a-afdd-c06c3bd42ec4
# ╟─36e8507a-383f-4fa1-aa8e-572b6c187264
# ╠═0fd64492-7cc3-421a-8448-862dcdcf49c6
# ╠═3049f012-1d05-4632-8554-b506e7afb792
# ╟─770f61d5-d449-45fc-88ef-eab7543701dd
# ╠═de9d12cf-adce-478e-9c31-8159adadde5e
# ╠═5b38e0d4-e873-4341-b8ba-aadc3b5538de
# ╟─7c39978f-29c8-4072-bfc5-b1bf678f9e63
# ╟─20a83e7a-ffc8-46f0-928c-db5fc87ad672
# ╠═4b7ecf4e-144c-4ddd-a3ee-8592ecd3eea5
# ╟─1d5b55f7-8a93-4bff-a568-2b283bab75ad
# ╟─55c8b291-3736-4fc7-9ebf-e3028ce3d939
# ╠═aad83a92-e478-11ee-1571-1b43c9076e2b
# ╠═35a317c3-73bf-4e31-ad28-a27bae74eec5
# ╟─f3d0a879-06cc-47a2-a791-9696def524d7
# ╠═a1f9a786-708b-4444-9290-77838bd8336d
# ╟─b3a2b8cd-06bd-4ae1-aeda-b226ab6f1bf6
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
