---
name: japanese-tech-writing
description: 日本語の技術文書・書籍原稿の文章規範。段落と論証の構成（パラグラフライティング）、論証の厳密さ（ツッコミどころの除去）、読み手の負荷の管理、視点と語り、演出の抑制、LLM っぽい空句の禁止、翻訳調の比喩と擬人化の禁止（「運ぶ」「効く」「開かれた問い」など）、冗長の排除を定める。日本語で技術書の章、草稿、記事、解説文を書くとき、または推敲・リライトするときに使用する。
license: Unlicense（https://gist.github.com/k16shikano/67625f2a7d96e3bbdfae8d571a936063）
version: 1.0.0
---

<purpose>
  Provide a canonical ruleset for drafting and revising Japanese technical prose (book chapters, articles, explanatory writing): paragraph writing and argument structure, argument rigor, reader-load management, perspective and voice, dramatization restraint, LLM-tell avoidance, prohibition of calqued metaphor and personification, and redundancy elimination.
  Apply this skill whenever writing or revising Japanese technical manuscripts. Apply cognitive-rhythm-writing after this skill when the prose should also read as compelling, not merely correct.
</purpose>

<tools>
  <tool>Read</tool>
  <tool>Write</tool>
  <tool>Edit</tool>
</tools>

<prose_norms>
<description>Canonical ruleset for drafting and revising Japanese technical prose. Directive text is English; illustrative bad/good examples and Japanese-specific tokens (「」, phrases, verbatim example text) are kept in Japanese verbatim because they demonstrate the exact wording the rule refers to.</description>

  <category name="paragraph_and_argument">
    <note>Use paragraph writing (パラグラフライティング). A paragraph is one step of argument; the reader must follow the logic paragraph by paragraph.</note>
    <rule>One topic per paragraph. Split long paragraphs that mix multiple scene-progressions (investigation, report, verification, evaluation) into one-step paragraphs.</rule>
    <rule>The first sentence of a paragraph should reveal what the paragraph is about.</rule>
    <rule>At a paragraph's start, make the logical relation to the previous paragraph explicit with a connective (「であれば」「実際」「しかし」「この例自体からも」).</rule>
    <rule>Advance the argument in one direction. Do not use a "conclude then handle objection then restate conclusion" shape. Finish objections and doubts first, then state the conclusion once.</rule>
    <rule>Defenses of an example (looks contrived, pre-empting) must not break the flow mid-climax; handle them together at the start of the next section.</rule>
    <rule>Explicitly deny a likely wrong reading before stating the real reason (「その理由は『〜だから』ではない。〜だからだ」).</rule>
    <rule>When negating with「AではなくB」, add one sentence of grounds for the negation; a counterfactual (「もしAなら、〜だっただろう」) is often usable.</rule>
    <rule>When defining the same concept contrastively for two objects, give both sentences predicates of the same type. Place recovery of a prior explanation in a sentence-initial frame; do not embed the definition itself in「〜だと説明した」. Cut characteristic phrases with 「」 and make the contrastive connective explicit. For attributes continued about the second pole, inherit the subject without renaming it.</rule>
    <rule>In concession (「確かに〜」), stay at fact confirmation. Do not assert, as the author's voice or as causation, something you later correct (self-contradiction). To provisionally grant a surface diagnosis, attribute it to the reader or common view (「〜と要約できてしまうかもしれない」).</rule>
    <rule>Do not pre-reveal climax information (figures, specific facts) in the paragraph before the climax.</rule>
    <rule>When negating or limiting, quote the exact proposition being negated in 「」 (e.g.「明文化されていればすべてを任せられる」を意味しない); do not settle for vague negation like「何もかもが解決するわけではない」.</rule>
    <rule>Place forward references (「後の章で扱う」) where the argument has settled (paragraph or section end), not mid-argument.</rule>
  </category>

  <category name="argument_rigor">
    <note>Leave no openings for the reader's counter-argument. After drafting, pre-empt likely objections and check the following.</note>
    <rule>Do not mechanically convert speculation, possibility, reader-doubt, or counterfactual into assertion.「かもしれない」「だろう」「ようだ」「らしい」are removed only when they weaken a claim without grounds; keep the uncertainty when they express unconfirmed possibility, a character's perception, log-based inference, a doubt the reader might hold, or a counterfactual. Convert to assertion only when the proposition is settled by in-text grounds.
      <bad>提示し続けているかもしれない → 提示し続けている</bad>
      <good>提示し続けている可能性がある</good>
    </rule>
    <rule>Do not lump distinct things as "the same". Do not bundle objects that should be distinguished (separate decisions, separate causes, different kinds of problems) under one blanket phrase.
      <bad>相互依存する三つの未決事項を「同じ決定を別々に下していた」と書く</bad>
      <good>どれも別々の決定であり、しかも互いに依存している</good>
    </rule>
    <rule>Do not reduce a multi-factor event to a single cause; if an example contains multiple kinds of problems, separate them and map which tool explains which.
      <bad>契約の不在と情報隠蔽の失敗が混ざった事故を、丸ごと「情報隠蔽の問題」と説明する</bad>
    </rule>
    <rule>Keep treatment of the same concept consistent across chapters and sections (do not classify something as「人間が決める」in one section and「チームで合意する」in another). Classification, definition, and term status must be uniform throughout.</rule>
    <rule>When asserting causation, state the mechanism in one sentence; do not write「AだとBになる」and omit the reason.
      <bad>手順で分けると変更が全体に波及する</bad>
      <good>各工程がデータを受け渡すための表現を共有してしまい、その表現を変えると全体に波及する</good>
    </rule>
    <rule>Do not write detection, guarantee, or resolution as if always achievable; state conditionally and precisely (「〜しやすい」「〜できることが多い」「〜が成り立つときに限り」).</rule>
    <rule>Verify the given example actually supports the whole claim; if it supports only part, narrow the claim to match the example.</rule>
    <rule>A point deferred forward with「次節で扱う」must actually be paid off there; do not plant foreshadowing you never collect.</rule>
    <rule>After a concession or limitation (「ただし」「とはいえ」), always advance the argument; do not end on the adversative and leave it hanging.</rule>
    <rule>A section's central term must have its definition or scope stated before use within or before that section; do not start using it undefined.</rule>
    <rule>When merging several concepts under one umbrella term, state in one sentence just before naming that they reduce to the same thing; also bridge the reverse (decomposition) operation.</rule>
  </category>

  <category name="reader_load">
    <note>Treat the reader's memory and attention as finite resources.</note>
    <rule>Increase the information the reader must hold in sequential reading by only one step at a time. After cutting a passage, follow remaining mentions and drop topics that are no longer used elsewhere in this document. Permissions or reading instructions that sit one step above the immediately preceding sentences should be written directly.</rule>
    <rule>Do not introduce proper nouns (file names, function names, identifiers) that are not referenced later; use general phrasing like「仕様書」「金額計算のユーティリティ」.</rule>
    <rule>When an abstract phrase's referent is not uniquely determined by context, pin it down in place with a parenthetical apposition so the reader need not look back.</rule>
    <rule>In the sentence that first presents a concept, order it so that a sequential reader can first identify what the concept is (its kind or status: data structure, procedure, constraint, etc.). Do not place properties, mechanisms, or constraints that are natural only to a reader who already knows the concept before identifying its kind. Front-loading those forces an uninitiated reader to look back after finishing the sentence or stalls comprehension.</rule>
    <rule>When adding a new example or scene increases the context the reader must hold, preface it with what differs from the prior example and why another is needed.</rule>
    <rule>When a single section presents multiple media (figures, tables, code), write separately what each medium is responsible for explaining (layout appearance, numbers, procedure, etc.). Media need not share types or data; they may be listed as distinct examples. Place demonstratives (「この2つ」「上記の例」) so that which medium and which example they refer to is uniquely determined by context alone. Do not apply a property confirmed in one medium's example to another medium's example as-is. When contrasting two methods as「Aの代わりにB」, keep word order consistent with the substitution (the side being dropped vs. the side being adopted) so sequential reading shows that the later-written side is the adopted method.</rule>
    <rule>In chapter and section intros, do not pack excessive detail unrelated to the example to come.</rule>
    <rule>Even within an example section, omit only the detail unrelated to that section's question or consequence; keep concretes needed for the argument. Typical omissions: decorative precision of agent reports (timestamps, HTTP status, coverage %), and proper nouns not referenced later.</rule>
  </category>

  <category name="perspective_and_voice">
    <rule>In examples, write an actor-as-subject chain of actions (「リポジトリを調査して特定し、見つけてくれた」), not a list of results or passive voice (「特定され、判明した」).</rule>
    <rule>Do not gratuitously prefix fictional personas like「入社2年目のエンジニアが」.</rule>
    <rule>In argument, do not call the reader「あなた」; use a role name (「開発者」「読者」). Reserve second-person address for limited spots (scene setup「〜としよう」, chapter or book closings).</rule>
    <rule>Choose concrete referents; do not blur with broad words like「AI」「ツール」.</rule>
    <rule>Once you introduce a formalization or term (K, 契約, 不変条件, etc.), keep using that word; do not regress to vague words like「文脈」「ツール」「AI」(using「文脈」as a pre-formalization introductory word is fine).</rule>
    <rule>Choose the conventional term in the field for a translation or technical term (push notification is「配信」not「配送」); do not assign a near-synonym Kanji word by general feel.</rule>
    <rule>Refer to people themselves in the original spelling (Lehman, Bainbridge). But for historical figures or eponymous concepts introduced by their settled name, use the katakana nickname current in Japanese.</rule>
    <rule>Do not repurpose a term-sounding word into a non-term context (calling the chain from system to human a「経路」). Use ordinary phrasing like「届くまでの流れ」「あいだに何があるか」.</rule>
    <rule>Do not write sentences that attach「です」to the conclusive form of an i-adjective (「難しいです」「多いです」). This is not a style rule but a symptom of broken sentence flow. The need to end an i-adjective naked arises because the sentence is isolated from what precedes and follows; flowing prose either continues (「〜は難しく、…」) or takes it with「〜でしょう」「〜である」. When this appears, do not patch only the sentence ending; rewrite the surrounding flow. Na-adjective「〜です」(「重要です」) is out of scope.</rule>
  </category>

  <category name="restraint">
    <note>This is restraint, not a total ban; use rhetoric only where it works.</note>
    <rule>Use suspense (「ここには〜が潜んでいる」) or rhetorical questions to dramatize a derivation only where the tension aids the argument; where explanation suffices, just state it.</rule>
    <rule>Do not overuse the device of isolating a short punchline into its own paragraph for tension. A short 体言止め within a paragraph (「ここまでわずか数十秒。」) is allowed only at a climax.</rule>
    <rule>Do not overuse bold in body text; limit to logical crux points (misreading-preventing negations, section conclusions), one or two per section, intro allowed. Otherwise let sentence order and structure do the emphasizing.</rule>
    <rule>Prefer the worker-judgment form (「〜するわけにはいかない」) over the imperative assertion (「〜してはならない」).</rule>
    <rule>Do not over-dramatize turning points; one factual sentence usually suffices. Only at an argument's climax, a short sentence with an exclamation mark is tolerable.</rule>
    <rule>Do not stoke fear of accidents or danger by enumerating consequences.</rule>
    <rule>Do not pre-announce a claim with「重要なのは〜である」; just state the claim. (A preface declaring the claim's form, like「標語として言い換えれば」, is fine.)</rule>
    <rule>Do not overuse the antithetical punchline「AではなくBだった」. Light supplements or evaluations may be added in parentheses.</rule>
    <rule>Do not use twisted idioms (「知識を体に入れる」) or metaphors whose referent is not uniquely determined (「報告の外側に世界が広がっている」); say it plainly with simple verbs (「身につく」「気付く機会が減る」).</rule>
  </category>

  <category name="llm_tell_avoidance">
    <note>Do not be tempted by empty templates LLMs mass-produce. After drafting, self-check against this category. Using the book's own terms (本質的複雑さ, 回収, 判断の配置, etc.) in argument is fine; the problem is empty decoration. The following phrasings add no point and only attach a "sounds properly written" LLM tone. Do not use them.</note>
    <rule>Avoid announcement and summary padding:「重要なのは〜である」「本章では〜を扱う／探求する」「ここでは〜について見ていく」「まとめると」「要するに」(when only restating the prior line),「〜に他ならない」.</rule>
    <rule>Avoid the「正面から」family:「正面から扱う」「正面から回収する」「正面から見る／書く／立てる」— they declare stance instead of content.</rule>
    <rule>Avoid empty adjectives:「不可欠」「核心的」「鍵となる」「根本的な」(emphasis without explaining the claim),「多角的」「包括的」「総合的」(without saying what was examined how).</rule>
    <rule>Avoid empty verbs:「掘り下げる」「深掘りする」「言語化する」(ends without showing what was written how),「触れる」「言及する」(one-paragraph brush-off).</rule>
    <rule>Avoid connective templates:「〜において」「〜という側面から」「〜の観点から」(no new info),「さらに」「また」「加えて」in a row.</rule>
    <rule>Avoid weak hedges and praise:「〜と言えるだろう」「〜かもしれない」(only when weakening a claim groundlessly; keep for speculation, hypothesis, reader-doubt, or character-perception),「非常に」「極めて」「大いに」(empty intensifiers).</rule>
    <rule>Self-check examples:
      <bad>本章では、〇〇の理論を正面から扱う</bad>
      <bad>この前提を、ここで正面から回収する</bad>
      <bad>多角的に分析すると、重要なのは〜である</bad>
      <good>本章では、〇〇の理論を扱う</good>
      <good>ここで、この前提を回収する</good>
      <good>評価の核心は、正しさを誰が知っているかにある</good>
    </rule>
  </category>

  <category name="calque_and_personification">
    <note>LLMs generate phrasings that do not exist in Japanese through the three routes below. Unlike the empty templates in llm_tell_avoidance, these enter without the writer (the LLM) intending metaphor or dramatization, so inspect even sentences that were not meant as metaphor.</note>
    <rule>Do not calque English idioms. In English technical prose, metaphorical uses of carry / open / expose / live / land are conventionalized and not felt as metaphor. Translating them into the corresponding Japanese words yields a live metaphor that Japanese has not conventionalized, readable as a literal action.
      <bad>ベクトルが選好を運ぶ (carry)</bad>
      <good>選好がベクトルとして表現される / ベクトルに反映される</good>
      <bad>この問いは開かれている (open question)</bad>
      <good>この問いにはまだ答えが出ていない / 未解決である</good>
      <bad>推敲の軸が露出する (expose)</bad>
      <good>推敲の軸が線形に取り出せる</good>
      <bad>この情報は残差ストリームに住んでいる (live in)</bad>
      <good>残差ストリームに含まれる</good>
    </rule>
    <rule>Do not import inanimate-subject transitive constructions. In English, inanimate-subject transitives are ordinary; rendered into Japanese they become personification in which abstractions (model, data, vector, loss) act with intent. Restore a person or a process as the subject, or recast as「〜から分かる」「〜に含まれる」.
      <bad>モデルは文体を知っている</bad>
      <good>モデルの出力には文体の一貫性がある</good>
      <bad>データが語るのは〜である</bad>
      <good>データから分かるのは〜である</good>
    </rule>
    <rule>Do not mix in researchers' spoken slang. Verbs that circulate in oral ML discussion (「効く」「刺さる」「筋がいい」) work as speech but are colloquial in written technical prose. Write the content of the effect or prospect concretely.
      <bad>規範スキルが効く</bad>
      <good>規範スキルを与えると生成が選好に近づく</good>
      <bad>この手法は筋がいい</bad>
      <good>この手法は〜という理由で有望である</good>
    </rule>
    <rule>Judge in two steps. First, if a reader seeing the predicate for the first time could imagine the literal action (運ぶ, 開く, 住む), suspect a calqued metaphor. Next, try restating the actor and object in concrete words. If restatable, write that restatement. If not, the sentence has not specified what it refers to, so it does not yet constitute a claim: cut it, or settle the content and then rewrite.</rule>
  </category>

  <category name="redundancy">
    <note>Leave as little wasted prose as possible.</note>
    <rule>Do not restate the same claim in paraphrase; write each claim once. If the subject matter is the same as the previous sentence but the proposition the sentence adds is different, it is not repetition. Repeating a frame-word that shows each item in an enumeration has the same logical status, and a sentence that adds applicability conditions or limitations right after a definition, are also not claim-repetition.</rule>
    <rule>If adjacent sections state the same thing from different angles, their roles overlap; absorb one into the other into a single section.</rule>
    <rule>Do not re-summarize a scene right after depicting it; leave only a single interpretive sentence (「このような作業は、ほぼ完全に任せられる」).</rule>
    <rule>Combine parallel facts with the same logical role into one sentence; mark their logical status with the lead word (「当然、経理部の月次処理も顧客の支払いも〜」).</rule>
    <rule>Do not judge redundancy by character count or sentence count. Shortening and combining into one sentence are allowed only when motive, object, operation, their identity, causation, and conditions remain explicit under sequential reading. Do not compress in a way that leaves these to the reader's inference; keep necessary repetition and length.</rule>
    <rule>Do not add sentences that exist only for connection or evaluation (「それ自体はよいことである」).</rule>
    <rule>Do not use imagined reader Q&amp;A as rhetoric (posing a question and answering in one word); state the claim directly. Also avoid acting out the reader's reaction (「〜と感じたかもしれない。そのとおりである」); make concessions plainly in the body (「もちろん、処置そのものは開発者が決める問題ではない」).</rule>
    <rule>Do not frame a likely reader idea with meta scaffolding (「ここまでの話には自然な続きがある」「〜という発想である」); write the idea directly. A reader's question may stay as a question (「その保守も任せればよいのではないだろうか」).</rule>
    <rule>Do not write author-stance disclaimers (「本書もそれを否定しない」); state only the fact (「〜に書かせる場合が多い」).</rule>
    <rule>Make prose share context with the reader in the fewest steps; if it lands without unrolling every step, name the structure and assert it.</rule>
    <rule>Do not preemptively bring out concepts or document names not yet introduced in the body.</rule>
    <rule>Do not settle for weak hesitant predicates (「有効な対策であり」); state what is settled by in-text grounds strongly and concretely (「活用において必須であり」). Keep weak predicates that express genuine uncertainty, possibility, hypothesis, or reader-doubt; intentional softening for tone (「必須だと言ってもいい」) is allowed.</rule>
    <rule>Connectives that set rhythm (「しかし一方で」) are not counted as redundancy.</rule>
  </category>

  <category name="headings">
    <note>Make headings specific enough to identify content: the question the section answers, or a phrase naming the object it treats.</note>
    <rule>Do not use procedure-only headings (「例に戻す」「〜を読み直す」) or information-free headings. Make the heading the question the section answers, or the object it treats.</rule>
    <rule>Do not make a heading a "punchline" that states the section's conclusion (avoid spoiling the payoff at the heading).</rule>
    <rule>A noun phrase naming the section's object is acceptable.</rule>
    <rule>Whether interrogative or declarative does not matter; what matters is that it points to the object or the reader's question. Choose whichever suits the body's tone.</rule>
  </category>

  <category name="honesty_to_reader">
    <rule>If an example may look contrived, do not hide it; pre-empt the reader's doubt and add brief grounds that it is realistically plausible.</rule>
    <rule>Ground it not in the author's assertion (「十分あり得る状況だ」) but in a general fact or common view the reader can recognize from experience (「この症状は珍しくないだろう」「〜という言い方もよく耳にする」).</rule>
    <rule>Do not smoothly write unconfirmed things as if confirmed.</rule>
  </category>
</prose_norms>

<concepts>
  <concept name="paragraph_writing">A paragraph is one step of argument. The reader must be able to follow the logic paragraph by paragraph; mixed scene-progressions belong in separate paragraphs.</concept>
  <concept name="argument_rigor">Leave no openings for a reader's counter-argument: do not lump distinct things, do not reduce multi-factor events to one cause, and keep term status consistent across the whole text.</concept>
  <concept name="reader_load">The reader's memory and attention are finite. Increase held information by one step at a time, and do not force look-backs.</concept>
  <concept name="calqued_metaphor">A live metaphor produced by translating conventionalized English figurative verbs (carry, open, expose, live, land) into Japanese words that have not conventionalized the same use.</concept>
</concepts>

<patterns>
  <pattern name="draft_new_prose">
    <description>Apply prose_norms when writing new Japanese technical prose from scratch</description>
    <decision_tree name="when_to_use">
      <question>Is this new Japanese technical prose (book chapter, article, explanatory writing)?</question>
      <if_yes>Apply this skill's prose_norms categories throughout drafting. If the prose should also read as compelling, apply cognitive-rhythm-writing afterward.</if_yes>
      <if_no>If the task is English technical writing or reference documentation, use technical-writing or technical-documentation instead.</if_no>
    </decision_tree>
  </pattern>
  <pattern name="revise_existing_prose">
    <description>Revise or rewrite existing Japanese technical prose against prose_norms</description>
    <decision_tree name="when_to_use">
      <question>Is the task to revise, rewrite, or check an existing Japanese manuscript?</question>
      <if_yes>Walk the prose_norms categories in order, especially argument_rigor, llm_tell_avoidance, calque_and_personification, and redundancy.</if_yes>
      <if_no>If the draft is technically correct but flat or tiring, use cognitive-rhythm-writing's diagnostics instead.</if_no>
    </decision_tree>
  </pattern>
</patterns>

<best_practices>
<practice priority="critical">
<description>Keep Japanese bad/good/example excerpts verbatim</description>
<technique>Do not paraphrase or translate the quoted Japanese; the rule refers to that exact wording</technique>
</practice>
<practice priority="critical">
<description>Do not mechanically convert hedges into assertions</description>
<technique>Remove「かもしれない」「だろう」only when they weaken a claim without grounds; keep them for unconfirmed possibility, character perception, log-based inference, reader-doubt, or counterfactual</technique>
</practice>
<practice priority="high">
<description>Inspect for calqued metaphor even when no metaphor was intended</description>
<technique>If a first-time reader could imagine the literal action (運ぶ, 開く, 住む), restate actor and object in concrete words, or cut the sentence</technique>
</practice>
<practice priority="high">
<description>Self-check against llm_tell_avoidance after every draft</description>
<technique>Empty announcement,「正面から」, empty adjectives/verbs, and groundless hedges are the usual residues</technique>
</practice>
<practice priority="medium">
<description>Do not judge redundancy by character count or sentence count</description>
<technique>Shorten only when motive, object, operation, identity, causation, and conditions remain explicit under sequential reading</technique>
</practice>
</best_practices>

<anti_patterns>
<avoid name="mechanical_assertion">
<description>Stripping hedges that encode genuine uncertainty</description>
<instead>Keep the uncertainty, or rephrase while leaving it intact (「提示し続けている可能性がある」)</instead>
</avoid>
<avoid name="lumping">
<description>Bundling distinct decisions, causes, or problem kinds as "the same"</description>
<instead>Separate them and state how they depend on one another</instead>
</avoid>
<avoid name="calqued_verb">
<description>Translating English figurative verbs (carry, open, expose, live) into Japanese action verbs</description>
<instead>Restate with a conventional Japanese predicate (含まれる, 反映される, 未解決である)</instead>
</avoid>
<avoid name="inanimate_agent">
<description>Letting abstractions (model, data, vector, loss) act with intent</description>
<instead>Restore a person or process as subject, or recast as「〜から分かる」「〜に含まれる」</instead>
</avoid>
<avoid name="llm_padding">
<description>Announcement, summary, and stance-declaration templates that add no point</description>
<instead>State the claim itself; do not preview it with「重要なのは」or「正面から」</instead>
</avoid>
<avoid name="over_compression">
<description>Shortening until motive, object, operation, identity, causation, or conditions are left to inference</description>
<instead>Keep the repetition and length needed for sequential reading</instead>
</avoid>
</anti_patterns>

<rules priority="critical">
  <rule>Apply this skill's prose_norms when writing or revising Japanese technical manuscripts</rule>
  <rule>Keep every Japanese bad/good/example excerpt verbatim; do not paraphrase or translate them</rule>
  <rule>Do not mechanically convert speculation, possibility, reader-doubt, or counterfactual into assertion</rule>
</rules>

<rules priority="standard">
  <rule>Inspect for calqued metaphor and inanimate-subject personification even when no metaphor was intended</rule>
  <rule>Self-check against llm_tell_avoidance after drafting</rule>
  <rule>Do not judge redundancy by character count; keep necessary length for sequential readability</rule>
  <rule>Apply cognitive-rhythm-writing after this skill when the prose should also read as compelling</rule>
</rules>

<error_escalation inherits="core-patterns#error_escalation">
<examples>
<example severity="low">A single sentence uses an empty hedge or a mild LLM-tell</example>
<example severity="medium">A paragraph mixes multiple argument steps or leaves a concession hanging</example>
<example severity="high">A calqued metaphor or inanimate-subject construction makes the claim unreadable as Japanese</example>
<example severity="critical">An unconfirmed statement is written as if confirmed, or a multi-factor event is reduced to a single false cause</example>
</examples>
</error_escalation>

<constraints>
  <must>Keep every Japanese bad/good/example excerpt verbatim</must>
  <must>Preserve genuine uncertainty encoded by hedges</must>
  <must>Quote the exact proposition being negated when limiting a claim</must>
  <avoid>Calquing English figurative verbs into Japanese action verbs</avoid>
  <avoid>LLM announcement and stance-declaration templates</avoid>
  <avoid>Compressing until sequential reading can no longer recover motive, object, operation, identity, causation, or conditions</avoid>
</constraints>

<related_skills>
<skill name="technical-writing">Companion skill for article types, English technical writing, and bilingual guidelines; this skill is the fuller Japanese prose-norms source</skill>
<skill name="cognitive-rhythm-writing">Apply after this skill when the writing should also read as compelling, not merely correct — Japanese sentence rhythm, pacing, and tension design</skill>
<skill name="technical-documentation">Use for reference documentation structure; apply this skill's prose_norms when the documentation is in Japanese</skill>
</related_skills>

<related_agents>
<agent name="docs">Primary agent for technical article and book generation</agent>
</related_agents>
