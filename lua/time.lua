--[[
time_translator: 关键词转化
--]]

-- TODO: 需要替换为哈语关键词触发
local function translator(input, seg)
	-- 日期关键词处理
	-- BUG 哈语混排错误
	if (input == "date") then
		yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d"), "(日期)"))
		yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), "(日期)"))
		-- 仅 RTL 下正确
		yield(Candidate("date", seg.start, seg._end, os.date("%Y" .. "جۇل" .. "%m" .. "اي" .. "%d" .. "كۇن"), "()"))
	end

	-- 当前关键词处理
	if (input == "now") then
		yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d %X"), "(当前时间)"))
	end

	-- 时间关键词处理
	if(input == "time") then
		yield(Candidate("time", seg.start, seg._end, os.date("%X"), "(时间)"))
	end
end

return translator