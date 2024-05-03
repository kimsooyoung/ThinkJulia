### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ 2d515d70-07ca-11ef-1060-fd2ba819c10a
md"""
# Sooyoung Kim's Think Julia 

![image](https://github.com/kimsooyoung/ThinkJulia/assets/12381733/260603e2-20ed-428e-b15b-0381f73fb46c)
"""

# ╔═╡ 199b0ba2-d6df-42c6-9b23-785cb0b114ae
md"""
## Dictionary (딕셔너리)
"""

# ╔═╡ a0190f14-a020-4b65-88ae-2bab8b442d96
md"""
## 11.1 딕셔너리는 Mapping
"""

# ╔═╡ 89b1902d-21c9-4171-ba46-07bb0ea7f3cc
md"""
이전 시간의 배열에서, 각 원소는 삽입된 순서에 따른 **인덱스**를 고유 번호로 갖고 있었습니다. 

이번 시간 배울 딕셔너리는 숫자가 아닌 어떠한 값이라도 인덱스로 가질 수 있습니다. 마치 영-한 사전에서 각각의 한글 단어가 영어 단어로 매칭되어 있는 것처럼요. 그래서 이름도 "사전"이라는 뜻의 딕셔너리입니다.
"""

# ╔═╡ c958c083-bc92-4e80-9960-c48b24bb217c
md"""
> 비어있는 딕셔너리의 생성은 Dict()를 사용합니다.
"""

# ╔═╡ 8adb5080-bf43-4e47-ad9a-ce5413f7f471
begin
	eng2kor = Dict()
end

# ╔═╡ a6a12dc9-1c18-4276-bcf3-a22c1ab45a7a
md"""
이제 딕셔너리에 하나씩 원소를 추가할 것입니다. 딕셔너리에서 인덱스는 **Key**, 원소를 **Value**라고 부릅니다. 배열과 달리 인덱스가 어떠한 것이 올지 모르니 항상 Key-Value 세트로 원소를 추가해야 합니다.
"""

# ╔═╡ cd806564-53be-48fd-96b5-a550b37f9c6d
begin
	eng2kor["one"] = "하나"
	eng2kor["two"] = "둘"
	eng2kor["three"] = "셋"

	@show eng2kor, typeof(eng2kor)
end

# ╔═╡ 2d9a2dd8-e8e6-46b7-ab4f-81f758776d69
md"""
eng2kor을 출력해보면 **key => value**의 표현을 확인할 수 있습니다. 딕셔너리의 첫 생성 시에도 이 표현법을 사용 가능합니다.
"""

# ╔═╡ 6c9226f6-f4d3-4dc8-8438-e49c7c45a10c
let
	eng2kor = Dict(
	    "one" => "하나", 
	    "two" => "둘", 
	    "three" => "셋", 
	)

	@show eng2kor, typeof(eng2kor)
end

# ╔═╡ 90533c8e-a9dd-4591-864a-937a427f8dba
md"""
!!! notes
	딕셔너리의 생성 시 **Dict()**로 생성된 경우와, **Dict(keys => values)**로 생성된 경우는 어떠한 차이를 가질까요?

	앞선 코드의 typeof() 결과에서 보이듯이 Dict()로 생성된 딕셔너리의 타입은 **Dict{Any, Any}**인 반면, Dict(keys => values)로 생성된 딕셔너리는 **초기 keys, values에 부합하는 type**을 가짐을 알 수 있습니다.
"""

# ╔═╡ 1457a50a-19a7-49b2-afef-7b82b61bc09f
md"""
!!! hint "간단 퀴즈"
	* string key - integer value만을 사용할 예정입니다. 이를 딕셔너리로 표현하고자 했을 때 어떻게 선언하는 것이 좋을까요?
	* string key - integer value만을 사용할 줄 알았는데, character key를 사용해야 한다는 것을 깨달았습니다. 이를 구현해보고 문제를 파악해보세요
"""

# ╔═╡ d2198353-5bb9-4e09-984c-37df54b8a5c3
md"""
딕셔너리의 원소는 key를 통해 조회합니다. 더불어, 딕셔너리에 존재하지 않는 key를 참고하려 하면 당연하게도 에러가 발생합니다.
"""

# ╔═╡ 7d5852d5-84db-40ed-a821-2a6676e479ab
begin
	@show eng2kor["two"]
	@show eng2kor["four"]
end

# ╔═╡ 9b5c5ca2-a4ee-4a9d-818b-7a4554d35416
md"""
그런데 아무리 우리가 만든 딕셔너리라 할지라도 그 내부의 모든 key를 외우고 있는 것은 아닙니다. 

이런 경우를 대비하여, **keys()**를 사용하면 딕셔너리 내부의 모든 key를 배열의 형태로 얻을 수 있습니다. 
"""

# ╔═╡ 5b32781f-a1fe-475b-9fb2-4530689c4a67
begin
	ks = keys(eng2kor)
	@show ks, typeof(ks)
	@show ks
end

# ╔═╡ d96cd8d0-4113-4605-a9e5-86ffdf23c6e0
md"""
특정 key가 딕셔너리에 존재하는지 알고 싶다면 아래와 같이 확인해 볼 수 있겠습니다.
"""

# ╔═╡ 253a3a8f-b29a-4ac8-b9e0-0a922aa698b2
begin
	if "one" ∈ keys(eng2kor)
		print(eng2kor["one"])
	end
end

# ╔═╡ 5a256e71-6284-46fb-8fba-228f5f73bb41
md"""
마찬가지로 values()를 통해 딕셔너리의 모든 value를 얻을 수 있습니다.
"""

# ╔═╡ fe26aff1-b898-40c6-a0c1-c5b736799f63
begin
	vs = values(eng2kor)
	@show "둘" ∈ vs
end

# ╔═╡ e5738888-30ee-4580-b672-722981d875b3
md"""
!!! note
	∈ 연산자는 배열에서도 원소의 존재 여부를 확인하기 위해 사용했습니다. 이 경우 Julia는 배열 내 모든 원소를 차례로 순회하게 됩니다. 당연히 배열 자체가 길어지면 검색 시간도 길어집니다. 
	
	반면, 딕셔너리의 경우 key - value로 이미 mapping이 되어있기 때문에 아무리 원소가 많은 경우에도 검색 시간은 일정 범위를 벗어나지 않는다는 장점을 갖고 있습니다.
"""

# ╔═╡ 5b40fecc-96ae-4bdc-8263-e0c5e392f480
md"""
딕셔너리의 추가적인 속성을 알아봅시다.
- length를 통해 전체 key-value 쌍 개수를 알아낼 수 있습니다.
- 딕셔너리는 순서를 따지지 않습니다. abc나 ㄱㄴㄷ순으로 정렬되는 것이 아니라는 말이지요.
"""

# ╔═╡ d9dae3b5-73df-4305-8d8c-014ac6954643
begin
	length(eng2kor)
	
	my_dict = Dict()
	my_dict['c'] = 3
	my_dict['a'] = 1
	my_dict['b'] = 2
	@show my_dict
end

# ╔═╡ bd010d98-8987-49b4-b0cb-5c00070f1c1a
md"""
## 11.2 딕셔너리의 활용: Counter
"""

# ╔═╡ b3a8417b-e2ef-4782-928f-fa07c5a0955d


# ╔═╡ Cell order:
# ╟─2d515d70-07ca-11ef-1060-fd2ba819c10a
# ╟─199b0ba2-d6df-42c6-9b23-785cb0b114ae
# ╟─a0190f14-a020-4b65-88ae-2bab8b442d96
# ╟─89b1902d-21c9-4171-ba46-07bb0ea7f3cc
# ╟─c958c083-bc92-4e80-9960-c48b24bb217c
# ╠═8adb5080-bf43-4e47-ad9a-ce5413f7f471
# ╟─a6a12dc9-1c18-4276-bcf3-a22c1ab45a7a
# ╠═cd806564-53be-48fd-96b5-a550b37f9c6d
# ╟─2d9a2dd8-e8e6-46b7-ab4f-81f758776d69
# ╠═6c9226f6-f4d3-4dc8-8438-e49c7c45a10c
# ╟─90533c8e-a9dd-4591-864a-937a427f8dba
# ╟─1457a50a-19a7-49b2-afef-7b82b61bc09f
# ╟─d2198353-5bb9-4e09-984c-37df54b8a5c3
# ╠═7d5852d5-84db-40ed-a821-2a6676e479ab
# ╟─9b5c5ca2-a4ee-4a9d-818b-7a4554d35416
# ╠═5b32781f-a1fe-475b-9fb2-4530689c4a67
# ╟─d96cd8d0-4113-4605-a9e5-86ffdf23c6e0
# ╠═253a3a8f-b29a-4ac8-b9e0-0a922aa698b2
# ╟─5a256e71-6284-46fb-8fba-228f5f73bb41
# ╠═fe26aff1-b898-40c6-a0c1-c5b736799f63
# ╟─e5738888-30ee-4580-b672-722981d875b3
# ╟─5b40fecc-96ae-4bdc-8263-e0c5e392f480
# ╠═d9dae3b5-73df-4305-8d8c-014ac6954643
# ╟─bd010d98-8987-49b4-b0cb-5c00070f1c1a
# ╠═b3a8417b-e2ef-4782-928f-fa07c5a0955d
