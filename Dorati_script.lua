local function EditNametoStatus(n,v)
    Status[n].isEnabled=v
    Status[Status[n].type][Status[n].Num].isEnabled=v
end

local function isim(c)
    local a=gg.getRangesList(c)
    if c == 'libSGF' then
        return'0x'..string.format('%X',a[1].start)
    else
        for _, v in ipairs(a) do
            if v.state == "Xa" then
                return '0x'..string.format('%X',v.start)
            end
        end
    end
end

local function setHexMemory(o, h)
    local a,b=Status.TYPE == 'UG' and isim('split_config.arm64_v8a.apk') or isim('libSGF'),0
    local t={}
    for x in h:gmatch'%S%S'do
        t[#t+1]={address=a+o+b,flags=gg.TYPE_BYTE,value=x..'r'}
        b=b+1
    end
    local s=gg.setValues(t)
    if type(s)~='string'then return true else gg.alert(s)return false end
end

local function Koumoku()
    local function AddStatus(args)
        local value = {type = args.type,isEnabled = args.isEnabled or off, Num = args.Num, Name = args.Name , toggle = args.toggle or nil, NOX = args.NOX or nil, UG = args.UG or nil, LD = args.LD or nil}
        Status[args.Name] = value
        Status[args.type][args.Num] = value
        group[args.Tag] = group[args.Tag] or {}
        table.insert(group[args.Tag], args.Name)
        return args.Num +1
    end
    local function Addchoicetbl(address,Name,value)
        (address or choicetbl).value[Name] = value
        local i = #(address or choicetbl).order + 1
        (address or choicetbl).order[i] = Name
    end
    choicetbl = {type = 'choice',value = {},order = {}}
    local address = nil
    Addchoicetbl(address,'⚠️注意事項⚠️','tyuui')
    Addchoicetbl(address,'一括設定',{type= 'multiChoice',value = {},order = {}})
    Addchoicetbl(address,'個別設定',{type= 'multiChoice',value = {},order = {}})
    Addchoicetbl(address,'スクリプト履歴削除','fileremove')
    Addchoicetbl(address,'ログアウト','logaut')
    Addchoicetbl(address,'スクリプト終了','Scriptend')
    address = choicetbl.value['一括設定']
    Addchoicetbl(address,'NoneA','ButtonA')
    Addchoicetbl(address,'戻る','back')
    address = choicetbl.value['個別設定']
    Addchoicetbl(address,'ドロップ系',{type= 'multiChoice',value = {},order = {}})
    Addchoicetbl(address,'無効系',{type= 'multiChoice',value = {},order = {}})
    --[[Addchoicetbl(address,'ゲート系',{['type']= 'multiChoice',['value'] = {},['order'] = {}})]]
    Addchoicetbl(address,'NoneB','ButtonB')
    Addchoicetbl(address,'戻る','back')
    address = choicetbl.value['個別設定'].value['ドロップ系']
    Addchoicetbl(address,'drop','ButtonB')
    Addchoicetbl(address,'閉じる','end')
    address = choicetbl.value['個別設定'].value['無効系']
    Addchoicetbl(address,'Mukou','ButtonB')
    Addchoicetbl(address,'閉じる','end')
    --[[address = choicetbl['value']['個別設定']['value']['ゲート系']
    Addchoicetbl(address,'gate','ButtonB')
    Addchoicetbl(address,'閉じる','end')]]
    if true then
        local i = 1
        Status.A = {}
        i = AddStatus({type = 'A', Tag = 'NoneA',Num = i, Name = 'おすすめ倍速遅延(UG)', toggle = {['倍速'] = {[on] = S_(1.5), [off] = off}, ['ぷに遅延'] = {[on] = S_(2), [off] = off}}})
        --[[i = AddStatus({type = 'A', Tag = 'NoneA',Num = i, Name = '完凸用', toggle = {['ワンパン'] = {[on] = on, [off] = off}, ['敵ターン無効'] = {[on] = on, [off] = off}, ['スコア'] = {[on] = on, [off] = off}, ['アイテム泥無効'] = {[on] = on, [off] = off}, ['妖怪泥無効'] = {[on] = off, [off] = on}, ['鍵演出スキップ'] = {[on] = on, [off] = off}, ['リザルトスキップ'] = {[on] = on, [off] = off}, ['フレンドアイコン無効'] = {[on] = on, [off] = off}, ['会話無効'] = {[on] = on, [off] = off}, ['虫眼鏡無効'] = {[on] = on, [off] = off}, ['封印無効'] = {[on] = on, [off] = off},['確泥(妖怪)'] = {[on] = on, [off] = off}, ['確泥エラー回避'] = {[on] = on, [off] = off}}})]]
        --[[i = AddStatus({type = 'A', Tag = 'NoneA',Num = i, Name = 'Yポ周回用', toggle = {['ワンパン'] = {[on] = on, [off] = off}, ['敵ターン無効'] = {[on] = on, [off] = off}, ['スコア'] = {[on] = on, [off] = off}, ['妖怪泥無効'] = {[on] = on, [off] = off}, ['鍵演出スキップ'] = {[on] = on, [off] = off}, ['リザルトスキップ'] = {[on] = on, [off] = off}, ['フレンドアイコン無効'] = {[on] = on, [off] = off}, ['会話無効'] = {[on] = on, [off] = off}, ['虫眼鏡無効'] = {[on] = on, [off] = off}, ['封印無効'] = {[on] = on, [off] = off}, }})]]
        i = AddStatus({type = 'A', Tag = 'NoneA',Num = i, Name = '周回用', toggle = {['ワンパン'] = {[on] = on, [off] = off}, ['敵ターン無効'] = {[on] = on, [off] = off}, ['スコア'] = {[on] = on, [off] = off},['妖怪泥無効'] = {[on] = on, [off] = off}, ['鍵演出スキップ'] = {[on] = on, [off] = off}, ['リザルトスキップ'] = {[on] = on, [off] = off}, ['フレンドアイコン無効'] = {[on] = on, [off] = off}, ['会話無効'] = {[on] = on, [off] = off}, ['虫眼鏡無効'] = {[on] = on, [off] = off}, ['封印無効'] = {[on] = on, [off] = off},}})
        i = AddStatus({type = 'A', Tag = 'NoneA',Num = i, Name = '初期垢用スキップ', toggle = {['チュートリアルスキップ'] = {[on] = on, [off] = off},['スコアタ郵便イベ解放'] = {[on] = on, [off] = off}}})
    end
    if true then
        local i = 1
        Status.B = {}
        i = AddStatus({type = 'B', Tag = 'drop',Num = i, Name = '確泥(妖怪)',
                        ['UG'] = {{offset = '3957110',Value = {[off] = 'h F6 03 1F 2A',[on] = 'h 20 11 22 2A'}}}})
        i = AddStatus({type = 'B', Tag = 'drop',Num = i, Name = '確泥エラー回避',
                        ['UG'] = {{offset = '3F64B8C',Value = {[off] = 'h E0 03 1F 2A',[on] = 'h 20 00 80 52'}}}})
        i = AddStatus({type = 'B', Tag = 'drop',Num = i, Name = '妖怪泥無効',
                        ['UG'] = {{offset = '39570D4',Value = {[off] = 'h F3 03 1F 2A',[on] = 'h 33 00 80 52'}}}})
        i = AddStatus({type = 'B', Tag = 'drop',Num = i, Name = 'アイテム泥無効',
                        ['UG'] = {{offset = '323F248',Value = {[off] = 'h FD 7B BA A9',[on] = 'h C0 03 5F D6'}}}})
        i = AddStatus({type = 'B', Tag = 'Mukou',Num = i, Name = 'フレンドアイコン無効',
                        ['UG'] = {{offset = '4408E04',Value = {[off] = 'h FF 83 03 D1',[on] = 'h C0 03 5F D6'}}}})
        i = AddStatus({type = 'B', Tag = 'Mukou',Num = i, Name = '会話無効',
                        ['UG'] = {{offset = '49701E8', Value = {[off] = 'h FF 83 01 D1 E8 23 00 FD',[on] = 'h C0 03 5F D6 C0 03 5F D6'}}}})
        i = AddStatus({type = 'B', Tag = 'Mukou',Num = i, Name = '虫眼鏡無効',
                        ['UG'] = {{offset = '453D4F0',Value = {[off] = 'h FF 43 02 D1',[on] = 'h C0 03 5F D6'}},
                                 {offset = '4713B70',Value = {[off] = 'h FF 43 02 D1',[on] = 'h C0 03 5F D6'}}}})
        i = AddStatus({type = 'B', Tag = 'Mukou',Num = i, Name = 'ランキング無効',
                        ['UG'] = {{offset = '44E0F08',Value = {[off] = 'h FD 7B BA A9',[on] = 'h C0 03 5F D6'}}}})
        i = AddStatus({type = 'B', Tag = 'Mukou',Num = i, Name = 'スコアタ無効',
                        ['UG'] = {{offset = '43538DC',Value = {[off] = 'h FF C3 05 D1',[on] = 'h C0 03 5F D6'}}}})
        --i = AddStatus({type = 'B', Tag = 'Mukou',Num = i, Name = '郵便無効',
        --                ['UG'] = {{offset = '42A2BF4',Value = {[off] = 'h FF C3 02 D1',[on] = 'h C0 03 5F D6'}}}})
        i = AddStatus({type = 'B', Tag = 'Mukou',Num = i, Name = '封印無効',
                        ['UG'] = {{offset = '47143B4',Value = {[off] = 'h FF C3 02 D1',[on] = 'h C0 03 5F D6'}}}})
        i = AddStatus({type = 'B', Tag = 'NoneB',Num = i, Name = '倍速',
                        ['UG'] = {{offset = '323CAA8',Value = {[off] = 'h EB FE FF 54',[S_(1.5)] = 'h 00 28 28 1E',[S_(2)] = 'h 00 10 28 1E',[S_(3)] = 'h 00 D0 28 1E',[S_(4)] = 'h 00 50 28 1E',[S_(5)] = 'h 00 10 2A 1E'}}}})
        i = AddStatus({type = 'B', Tag = 'NoneB',Num = i, Name = 'ぷに遅延',
                        ['UG'] = {{offset = '3994E60',Value = {[off] = 'h 00 18 28 1E',[S_(2)] = 'h 00 50 2A 1E',[S_(3)] = 'h 00 D0 28 1E',[S_(4)] = 'h 00 10 28 1E'}}}})
        i = AddStatus({type = 'B', Tag = 'NoneB',Num = i, Name = 'ワンパン',
                        ['UG'] = {{offset = '3B7AFF0',Value = {[off] = 'h 81 00 00 54',[on] = 'h 80 00 00 54'}}}})
        i = AddStatus({type = 'B', Tag = 'NoneB',Num = i, Name = '敵ターン無効',
                        ['UG'] = {{offset = '3F15AF0',Value = {[off] = 'h 96 83 08 91',[on] = 'h 96 07 00 91'}}}})
        i = AddStatus({type = 'B', Tag = 'NoneB',Num = i, Name = 'スコア',
                        ['UG'] = {{offset = '3F15804',Value = {[off] = 'h 01 00 15 8B',[on] = 'h 21 B3 A0 D2'}}}})
        i = AddStatus({type = 'B', Tag = 'NoneB',Num = i, Name = 'リザルトスキップ',
                        ['UG'] = {{offset = '3F08980',Value = {[off] = 'h 1F 0C 00 71',[on] = 'h 1F 04 00 71'}}}})
        i = AddStatus({type = 'B', Tag = 'NoneB',Num = i, Name = '鍵演出スキップ',
                        ['UG'] = {{offset = '4948014',Value = {[off] = 'h 01 09 40 B9 21 03 00 34',[on] = 'h 1F 09 40 B9 21 03 00 35'}}}})
        i = AddStatus({type = 'B', Tag = 'NoneB',Num = i, Name = 'チュートリアルスキップ',
                        ['UG'] = {{offset = '515236C',Value = {[off] = 'h 01 01 01 01',[on] = 'h 00 00 00 00'}}}})
        i = AddStatus({type = 'B', Tag = 'NoneB',Num = i, Name = 'スコアタ郵便イベ解放',
                        ['UG'] = {{offset = '44E04FC',Value = {[off] = 'h FF 03 01 D1',[on] = 'h C0 03 5F D6'}},
                                 {offset = '46B6CB4',Value = {[off] = 'h 21 00 80 52',[on] = 'h E1 03 1F 2A'}}}})
        i = AddStatus({type = 'B', Tag = 'NoneB',Num = i, Name = '箱落ち回避',
                        ['UG'] = {{offset = '235F4CC',Value = {[off] = 'h 21 01 27 1E 00 01 27 1E',[on] = 'h 00 01 27 1E 21 00 26 1E'}}}})
    end
end

local function ShokiSettei()
    _G.NN = _G.NN or '4.136.1'
    if _G.NN ~= 'MSDK' and (os.date('%Y%m%d%H%M') >= '202502312359' or _G.NN ~= '4.136.1') then
        gg.alert('✔︎︎︎scriptの有効期限が切れています✔︎scriptが更新されるまでしばらくお待ちください')
        EXIT()
    end
    gg.setVisible(true)
    local application, package = gg.getTargetPackage(), 'com.Level5.YWP'
    if application ~= package then
        gg.alert('プロセスが 妖怪ウォッチぷにぷに に設定されていません\nPackageName: ' .. package)
        EXIT()
    end
    folderPatch, shoki, success2, on, off, S_, Status, group, isMainActive = gg.FILES_DIR, true, true, '[ON]', '[OFF]', function(Num) return '['..Num..']' end, {TYPE = ' ',ver = ' ',Sver = 5,Fver = 5}, {}, false
    Koumoku()
end
function filerebort()
    --[[local filePath = '/storage/emulated/0/Dorati_script_rebort_file.txt']]
    local filePath = folderPatch..'Dorati_script_rebort_file.txt'
    local function fileExists(path)
        local file = io.open(path, 'r')
        if file then
            shoki = false
            file:close()
            return true
        else
            return false
        end
    end

    local function Shokifile(type)
        local file, Kakikomi = io.open(filePath, 'w'), {}
        if not file then
            gg.alert('ファイルの作成に失敗しました: ')
            os.exit()
        end
        table.insert(Kakikomi, 'TYPE:'..type)
        table.insert(Kakikomi, 'ver:'..Status.Sver)
        for i = 1, #Status.A do
            table.insert(Kakikomi, Status.A[i].Name..':'..Status.A[i].isEnabled)
        end
        for i = 1, #Status.B do
            table.insert(Kakikomi, Status.B[i].Name..':'..Status.B[i].isEnabled)
        end
        for _, value in ipairs(Kakikomi) do
            file:write(value .. '\n')
        end
        file:close()
        gg.toast('ファイルが作成されました: ')
    end

    function Uwagaki()
        local file, Kakikomi = io.open(filePath, 'w'), {}
        if not file then
            gg.alert('ファイルの上書きに失敗しました: ')
            os.exit()
        end
        table.insert(Kakikomi, 'TYPE:'..Status.TYPE)
        table.insert(Kakikomi, 'ver:'..Status.ver)
        for i = 1, #Status.A do
            table.insert(Kakikomi, Status.A[i].Name..':'..Status.A[i].isEnabled)
        end
        for i = 1, #Status.B do
            table.insert(Kakikomi, Status.B[i].Name..':'..Status.B[i].isEnabled)
        end
        for _, value in ipairs(Kakikomi) do
        file:write(value .. '\n')
        end
        file:close()
        gg.toast('ファイルが上書きされました: ')
    end

    function fileremove()
        Koumoku()
        local result, err = os.remove(filePath)

        if result then
            shoki = true
            gg.toast('ファイルが削除されました: ')
        else
            gg.alert('ファイル削除に失敗しました: ' .. err)
            os.exit()
        end
    end

    if not fileExists(filePath) then
        Shokifile('UG')
    end

    local function processFile()
        local file = io.open(filePath, 'r')
        if not file then
            print('ファイルを開けませんでした: ')
            EXIT()
        end
        local i = 1
        local line
        while true do
            line = file:read('*line')
            if not line then
                file:close()
                local ver = tonumber(Status.ver)
                local Fver = tonumber(Status.Fver)
                if Status.TYPE == 'UG' then
                    if ver >= Fver then
                        Status.ver = Status.Sver
                        return true
                    end
                else
                    return false
                end
            end
            local key, value = string.match(line, '([^:]+):(.+)')
            if key and value and Status[key] then
                if Status[key].isEnabled then
                    EditNametoStatus(key,value)
                else
                    Status[key] = value
                end
            end
            i = i + 1
        end
    end

    local success = processFile()
    if success then
        if not shoki then
            for _, value in pairs(Status.B) do
                if value.isEnabled ~= off then
                ButtonB(value.Name,value.isEnabled,true)
                end
            end
        end
        gg.toast('前回のデータから復元されました')
        Main()
    else
        fileremove()
    end
end

function tyuui()
    gg.alert(
    '⚠️スクリプト使用上の注意⚠️\n' ..
    '　■ぷに遅延は一度戦闘画面へ行くとその状態で固定されます\n' ..
    '　■倍速、ぷに遅延はご自身で調整してください\n' ..
    '　■確泥エラー回避はなつき5体時の稀なエラーを回避するものですBAN回避などではありません\n' ..
    '　■人魂演出無効、フィニッシュ演出無効は倍速環境ではBANの可能性があるため検証して使用ください\n'
    )
end

function Main()
    isMainActive = true
    FSQRT = -1
    if tblchoice('製作者:ドラチ',choicetbl) ~= false then
        Uwagaki()
        Main()
    end
end

function tblchoice(str,tbl)
    local tbl2 = {}
    local tbl3 = {}
    local tbl4 = {}
    for _, value in ipairs(tbl.order) do
        if string.match(value, '%a') ~= nil then
            for _, v in ipairs(group[value]) do
                table.insert(tbl2,v)
                table.insert(tbl4,v..Status[v].isEnabled)
                tbl3[v] = tbl.value[value]
            end
        else
            table.insert(tbl2,value)
            table.insert(tbl4,value)
        end
    end
    local function filter(key)
        local a, b, c, d, cache = false, false, false, false, tbl2[key]
        if tbl.value[cache] and type(tbl.value[cache]) == 'table' then
            if tblchoice(cache,tbl.value[cache]) == 'back' then
                tblchoice(str,tbl)
            end
        elseif string.match(tbl3[cache]or' ', '^Button') then
            local type1 = cache
            b = tbl3[cache]
            c = type1
            d = Status[c].isEnabled
        else
            if active(tbl.value[cache]) == 'back' then
                a = true
            end
        end
        return a, b, c, d
    end
    local choices = gg[tbl.type](tbl4, nil, str)
    local a, b, c
    if choices == nil then
        return false
    elseif tbl.type == 'multiChoice' then
        local type1, Name, isEnabled = {}, {}, nil
        for key in pairs(choices) do
            a, b, c, isEnabled = filter(key)
            if b ~= nil and c ~= nil then
                if isEnabled == on then
                    table.insert(type1,1,b)
                    table.insert(Name,1,c)
                else
                    table.insert(type1,b)
                    table.insert(Name,c)
                end
            end
        end
        for i = 1, #type1 do
            if type1[i] and Name[i] then
                Button(type1[i],Name[i])
            end
        end
    else
        a, b, c= filter(choices)
        if b and c then
            Button(b,c)
        end
    end
    if a then
        return 'back'
    end
end

function active(value)
    if string.match(value,'^tyuui$') then
        tyuui()
        Main()
    elseif string.match(value,'^back$') then
        return 'back'
    elseif string.match(value,'^fileremove') then
        fileremove()
        ShokiSettei()
        success2 = true
        isMainActive = false
        shoki = false
        FSQRT = 1
    elseif string.match(value,'^logaut$') then
        logaut()
    elseif string.match(value,'^Scriptend$') then
        EXIT()
    end
end

function Button(type1, Name)

    local tbl, tblcount = {}, 0

    local function filetr()
        if type1 == 'ButtonA' then
            return false
        end
        for _, n in pairs(Status[Name].UG) do
            for key in pairs(n.Value) do
                local index = tonumber(key:match('%[(%d+)%]'))
                if index and tblcount <= index then
                    tblcount = index
                end
            end
        end
        return tblcount > 0
    end

    if filetr() then
        for i = 1, tblcount do
            table.insert(tbl, S_(i))
        end
        table.insert(tbl, off)
        table.insert(tbl, '閉じる')

        local choices = gg.choice(tbl, nil, Name)
        if choices then
            _G[type1](Name, tbl[choices])
        end
    else
        local state = Status[Name].isEnabled
        _G[type1](Name, state == on and off or on)
    end
end

function ButtonA(Name,isEnabled)
    for key, value in pairs(Status[Name].toggle) do
        ButtonB(key,value[isEnabled],true)
    end
    EditNametoStatus(Name,isEnabled)
    gg.toast(Name .. isEnabled)
end

function ButtonB(Name, isEnabled, data)
    local cache = Status[Name]
    local type = (Status.TYPE == 'LD' and 'LD' or Status.TYPE == 'UG' and 'UG' or 'NOX')

    if cache[type] then
        for _, v in pairs(cache[type]) do
            setHexMemory(tonumber(v.offset,16), v.Value[isEnabled])
        end
        EditNametoStatus(Name,isEnabled)
        if not data then gg.toast(Name .. isEnabled) end
    else
        return gg.toast(Name .. 'は' .. type .. 'には対応していません')
    end
end

function logaut()
    local paths = {
        '/data/user/0/top.niunaijun.blackboxa64/blackbox/data/user/0/',
        '/data/data/',
        '/data/user/0/',
        '/data/data/com.Ymd.Modz64/blackbox/data/user/0/',
        '/data/data/top.niunaijun.dog64/blackbox/data/user/0/',
        '/data/data/top.niunaijun.blackboxa64/blackbox/data/user/0/'
    }
    for _, path in ipairs(paths) do
        os.remove(path..'com.Level5.YWP/files/.library/ywp_cud/data00.cud')
        os.remove(path..'com.Level5.YWP/files/.library/ywp_cud/data01.cud')
    end
    gg.processKill()
    gg.toast('ログアウトしました')
end

function EXIT()
    print('作成者:ドラチ')
    print('2次配布、転売禁止')
    print('(X)Twitter→@ryuuti_puni')
    gg.skipRestoreState()
    os.exit()
    gg.setVisible(true)
end

ShokiSettei()

while true do
    if gg.isVisible(true) then
    FSQRT = 1
    gg.setVisible(false)
    end

    gg.clearResults()

    if FSQRT == 1 then
        if not isMainActive then
            if filerebort() then
            end
        else
            Main()
        end
    end
end
