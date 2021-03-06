--サンダーエンド·ドラゴン
function c84417082.initial_effect(c)
	--xyz summon
	aux.AddXyzProcedure(c,aux.FilterEqualFunction(Card.GetLevel,4),3)
	c:EnableReviveLimit()
	--destroy1
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(84417082,0))
	e1:SetCategory(CATEGORY_DESTROY)
	e1:SetType(EFFECT_TYPE_IGNITION)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCountLimit(1)
	e1:SetCost(c84417082.cost1)
	e1:SetTarget(c84417082.target1)
	e1:SetOperation(c84417082.operation1)
	c:RegisterEffect(e1)
	--destroy2
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(84417082,1))
	e2:SetCategory(CATEGORY_DESTROY)
	e2:SetType(EFFECT_TYPE_IGNITION)
	e2:SetRange(LOCATION_MZONE)
	e2:SetCountLimit(1)
	e2:SetCost(c84417082.cost2)
	e2:SetTarget(c84417082.target2)
	e2:SetOperation(c84417082.operation2)
	c:RegisterEffect(e2)
end
function c84417082.cost1(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return e:GetHandler():CheckRemoveOverlayCard(tp,3,REASON_COST) end
	Duel.Hint(HINT_OPSELECTED,1-tp,e:GetDescription())
	e:GetHandler():RemoveOverlayCard(tp,3,3,REASON_COST)
end
function c84417082.target1(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return e:GetHandler():GetFlagEffect(84417082)==0
		and Duel.IsExistingMatchingCard(Card.IsDestructable,tp,LOCATION_MZONE,LOCATION_MZONE,1,e:GetHandler()) end
	e:GetHandler():RegisterFlagEffect(84417082,RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END,0,1)
	local g=Duel.GetMatchingGroup(Card.IsDestructable,tp,LOCATION_MZONE,LOCATION_MZONE,e:GetHandler())
	Duel.SetOperationInfo(0,CATEGORY_DESTROY,g,g:GetCount(),0,0)
end
function c84417082.operation1(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(Card.IsDestructable,tp,LOCATION_MZONE,LOCATION_MZONE,e:GetHandler())
	Duel.Destroy(g,REASON_EFFECT)
end
function c84417082.cost2(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return e:GetHandler():CheckRemoveOverlayCard(tp,5,REASON_COST) end
	Duel.Hint(HINT_OPSELECTED,1-tp,e:GetDescription())
	e:GetHandler():RemoveOverlayCard(tp,5,5,REASON_COST)
end
function c84417082.target2(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return e:GetHandler():GetFlagEffect(84417082)==0
		and Duel.IsExistingMatchingCard(Card.IsDestructable,tp,0,LOCATION_ONFIELD,1,nil) end
	e:GetHandler():RegisterFlagEffect(84417082,RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END,0,1)
	local g=Duel.GetMatchingGroup(Card.IsDestructable,tp,0,LOCATION_ONFIELD,nil)
	Duel.SetOperationInfo(0,CATEGORY_DESTROY,g,g:GetCount(),0,0)
end
function c84417082.operation2(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(Card.IsDestructable,tp,0,LOCATION_ONFIELD,nil)
	Duel.Destroy(g,REASON_EFFECT)
end
