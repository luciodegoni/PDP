% 允许将作为剧集英雄的角色与其相应的反派角色联系起来，
% 以及提供神秘感的额外角色和对情节重要的特殊装置.

% 需要同时满足的条件如下：
% 不想创新太多，角色必须在之前的某些剧集中出现过，
% 并且显然是不同的.
% 为了保持经典精神，英雄必须是一个绝地武士
% （曾经在光明面上的大师），从未转向黑暗面.
% 反派必须出现在多个剧集中，
% 并且必须保持某种模棱两可的特征，因此必须确保他在某些剧集中出现在
% 光明面上，并在同一剧集或之后的剧集中出现在黑暗面.
% 额外角色必须是具有异国情调的角色，以保持系列的美学.
% 额外角色必须与主角有紧密联系，这意味着他在他出现的所有剧集中都与英雄
% 或反派在一起.被认为是异国情调的角色包括非球形的机器人和
% 大型（大于15）或未知种族的生物.
% 装置必须为观众所熟悉，因此它必须是在多个剧集中出现的元素（3次或更多）

% 知识：

% 出现于（角色，剧集，光明面）.
出现于(luke, 帝国反击战, 光明面).
出现于(luke, 新的希望, 光明面).
出现于(vader, 新的希望, 黑暗面).
出现于(vader, 西斯的复仇, 光明面).
出现于(vader, 幽灵的威胁, 光明面).
出现于(c3po, 幽灵的威胁, 光明面).
出现于(c3po, 新的希望, 光明面).
出现于(c3po, 帝国反击战, 光明面).
出现于(chewbacca, 帝国反击战, 光明面).
出现于(yoda, 克隆人的进攻, 光明面).
出现于(yoda, 幽灵的威胁, 光明面).

% 大师（角色）
大师(luke).
大师(leia).
大师(vader).
大师(yoda).
大师(rey).
大师(duku).

% 特征（角色，外观）.
% 外观：
% 生物（种族，大小）
% 人类
% 机器人（形状）
特征(chewbacca, 生物(wookiee, 10)).
特征(luke, 人类).
特征(vader, 人类).
特征(yoda, 生物(未知, 5)).
特征(jabba, 生物(hutt, 20)).
特征(c3po, 机器人(类人)).
特征(bb8, 机器人(球形)).
特征(r2d2, 机器人(干衣机)).

% 出现的元素（剧集，装置）
出现的元素(幽灵的威胁, [光剑]).
出现的元素(克隆人的进攻, [光剑, 克隆人]).
出现的元素(西斯的复仇, [光剑, 面具, 死星]).
出现的元素(新的希望, [死星, 光剑, 千年隼]).
出现的元素(帝国反击战, [星图, 死星]).

% 前序（前一剧集，后一剧集）
前序(幽灵的威胁, 克隆人的进攻).
前序(克隆人的进攻, 西斯的复仇).
前序(西斯的复仇, 新的希望).
前序(新的希望, 帝国反击战).

前一集(Episode, PreviousEpisode) :-
    前序(PreviousEpisode, Episode).
前一集(Episode, PreviousEpisode) :-
    前序(PreviousEpisode, Episode).

是绝地武士(Hero) :-
    大师(Hero),
    not(出现于(Hero, _, 黑暗面)).

出现在多个剧集(Villain) :-
    findall(V, 出现于(V, _, _), ListV),
    length(ListV, Length),
    Length > 1,
    出现于(Villain, Episode1, Side1),
    出现于(Villain, Episode2, Side2),
    Episode1 \= Episode2,
    Side1 \= Side2.

出现在多个剧集(Villain) :-
    findall(V, 出现于(V, _, _), ListV),
    length(ListV, Length),
    Length > 1,
    出现于(Villain, Episode, Side1),
    出现于(Villain, Episode, Side2),
    Side1 \= Side2.

是异国情调(Extra) :-
    特征(Extra, 机器人(Form)),
    Form \= 球形.
是异国情调(Extra) :-
    特征(Extra, 生物(_, Size)),
    Size > 15.

是异国情调(Extra) :-
    特征(Extra, 生物(未知, _)).

始终陪伴(Extra, Hero, _) :-
    forall(出现于(Hero, Episode, _), 出现于(Extra, Episode, _)).
    
始终陪伴(Extra, _, Villain) :-
    forall(出现于(Villain, Episode, _), 出现于(Extra, Episode, _)).
    
是熟悉的(装置) :-
    出现的元素(_, Elements),
    member(装置, Elements),
    findall(Episode, 出现的元素(Episode, 装置), EpisodeList),
    length(EpisodeList, Length),
    Length >= 3.

新剧集(Hero, Villain, Extra, 装置) :-
    Hero \= Villain,
    Hero \= Extra,
    Villain \= Extra,
    是绝地武士(Hero),
    出现在多个剧集(Villain),
    是异国情调(Extra),
    始终陪伴(Extra, Hero, Villain),
    是熟悉的(装置).
