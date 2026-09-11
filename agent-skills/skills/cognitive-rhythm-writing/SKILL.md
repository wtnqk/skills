---
name: cognitive-rhythm-writing
description: 説明的な文章に緩急を設計するための規範。緩急を装飾ではなく認知モードの切替（観察→逡巡→断定→再観察）と未回収の緊張の管理として扱い、文の拍、段落の密度波形、節の入り方、緩みと駄文の判別、執筆後の機械的な点検手順を定める。読み物として読ませたい章・記事・解説文を生成するとき、または「密度はあるが平坦でおもしろくない」文章を診断・修正するときに使用する。
version: 2.1.0
---

<purpose>
  Provide a ruleset for designing cognitive-mode pacing (observation → hesitation → assertion → re-observation) and unresolved tension in Japanese explanatory prose, so that dense, technically correct writing also reads as compelling and keeps the reader turning the page.
  Apply japanese-tech-writing's prose_norms first, for sentence-level correctness, argument rigor, and hygiene. Apply this skill's rhythm_norms second, for pacing, tension, and engagement. The two rulesets are complementary rather than overlapping: prose_norms governs correctness and rigor (grammar, argument structure, redundancy, LLM-tell avoidance), while this skill governs pacing, tension, and rhythm. Where the two touch the same surface they corroborate rather than duplicate each other — for example, both independently forbid empty topic-announcement sentences like 「本章ではA、B、Cを扱う」: prose_norms because it is padding (see its llm_tell_avoidance category), this skill because it is an attitude-less agenda table (see rhythm_norms/opening_design below).
</purpose>

<tools>
  <tool>Read</tool>
  <tool>Write</tool>
  <tool>Edit</tool>
</tools>

<rhythm_norms>
<description>Canonical ruleset for designing cognitive-rhythm pacing in Japanese explanatory prose. Directive text is English; illustrative bad/good/example sentences and Japanese-specific phrasing (「」quotations, verbatim example text) are kept in Japanese verbatim because they demonstrate the exact wording the rule refers to.</description>

  <category name="fundamentals">
    <rule>Pacing is designed as a switch of cognitive mode, not a change in information density. Observation → hesitation → assertion → re-observation is one round-trip unit.</rule>
    <rule>The text always keeps open at least one unresolved tension (an unanswered question, an unverified conviction, or an answer promised for later). The moment all tension closes, the reader can stop reading.</rule>
    <rule>Write in the voice of a participant thinking through the problem, not a voice explaining a finished conclusion. The reader's re-enactment of the writer's process of reaching an answer becomes the reader's own re-enactment of thinking.</rule>
    <rule>Generation-side constraint: when applying this norm to write new sentences, draw material for beat, tension, and looseness only from the situation side (events, data, or statements in the depicted world; the narrator's state of judgment). Where the situation offers no material at a given position, leave that position flat rather than adding anything. Sentences that make the body of the text itself the topic are a violation of this norm, not an application of it. Any newly written or reshaped sentence must be run through the looseness-vs-padding test (see looseness_vs_padding) at the moment it is written.
      <bad>〜の列挙はしない</bad>
      <bad>問いは〜だけである</bad>
    </rule>
    <rule>The devices this norm defines are realized, not declared: do not write the names, procedures, or example phrasing of this norm's own devices (「答えの半分」「緊張」「回収」「問いを半分ずつ返す」, etc.) directly into the body text. 「問いを半分ずつ返す」is realized by writing the first half of the answer as content, not by announcing that the operation is about to happen. Sentences that declare the upcoming operation (「先に答えを半分だけ置く」「最後にもう一度だけ線を引く」) are themselves padding. If the device is working, the reader does not notice it exists.
      See looseness_vs_padding for the worked bad/good examples and the leak test that catches this.
    </rule>
    <note name="scene_free_exposition">In commentary or explanatory prose that has no narrative scene, the situation side is the nature of the object itself (data, calculations, trade-offs, a naive expectation broken by fact) plus the reader's inference or counter-question. Build tension from the object's nature — 「流暢さと正しさが一致しないのはなぜか」is about the object and is allowed. Do not use narration of the text's own progress as a substitute for tension just because there is no scene.</note>
    <rule>Prohibition of the short-sentence-shortening bias: do not cut sentences merely to produce a beat. Cutting the context an introduction needs to share (scope, viewpoint, axes of comparison, unsettled matters) in order to make it shorter is an omission, not pacing. Raise density only on top of context that has already been shared.</rule>
  </category>

  <category name="sentence_rhythm">
    <rule>Plant a short sentence as footing, let a longer sentence flow, and stop with a short sentence. "Plant → flow → stop" is the paragraph's basic beat.</rule>
    <rule>Do not push through with assertion alone; alternate assertion and hesitation. Assertion markers: 「〜だった」「〜である」「〜というわけだ」. Hesitation markers: 「〜に違いない」(a preconception later betrayed by fact), 「〜とは思う。ただ…」「〜だろうか」.</rule>
    <rule>Hesitation is not weakness but a device: a conviction later betrayed by fact becomes a setup that steers the reader's prediction before overturning it.
      <example>「うまくいっているに違いない。」→(次の段落で)「ところが、あとになって記録を見ると、そうではなかった。」</example>
    </rule>
    <rule>At a turning point, use the "concession → turn → short stop" beat. The short directive sentence after the turn fixes the reader's gaze.
      <example>「〜だろう。これからも〜だろう。しかし、ここで扱うのは〜のほうだ。考えたいのは、そちらである。」</example>
    </rule>
  </category>

  <category name="paragraph_density_wave">
    <rule>After 2-3 dense paragraphs in a row, place one sparse paragraph. Limit the sparse paragraph's function to one of: fixing a settled fact in a single line, presenting the next object of judgment, or switching viewpoint distance.</rule>
    <rule>Do not fix the viewpoint distance. Alternate paragraphs that hug the concrete (records, numbers, statements, code) with paragraphs that step back one level for meaning-making.</rule>
    <rule>Bulleted lists function not only to compress information but as a "pause" that halts the body's breathing. The one-level-back sentence after a list (「要するに〜」) works precisely because of this pause.</rule>
  </category>

  <category name="opening_design">
    <rule>The opening's job is to create one unresolved tension within the first few sentences; the type of opening is not fixed. Usable types include:
      <type>Restate the reader's own felt sense (「〜と感じることがあるだろう」), then move to a hypothesis (「〜が違うのかもしれない」)</type>
      <type>A direct question to the reader — but do not leave it abandoned; answer it immediately in the writer's own words</type>
      <type>A confident general proposition that the rest of the body goes on to test</type>
      <type>Affirmatively write out the narrator's own preconception in full, then break it with a scene grounded in fact</type>
      <type>Restate, in the participant's own words, a question left open by the previous chapter or section</type>
    </rule>
    <rule>Preview and summary are not forbidden. One or two sentences carrying an attitude (「〜を考えるうえで、これほど適切な切り口もないはずだ」「言い換えると〜という話である」) themselves create tension. What must be forbidden is only an attitude-less agenda table.
      <bad>本章ではA、B、Cを扱う</bad>
    </rule>
    <rule>State, in the reader's own words, the resistance the reader will likely feel (old, contrived, impractical, not relevant to me), dispatch it briefly, then enter the main topic.</rule>
    <note name="reader_voice_vs_padding">This category's "direct question to the reader" type and section_entry's counter-question device surface-resemble the reader-Q&amp;A/reaction-acting pattern that japanese-tech-writing's prose_norms/redundancy category bans (「〜と感じたかもしれない。そのとおりである」). The two rules do not conflict: prose_norms bans that pattern only when it is decorative padding with zero situation-side information, while this skill's reader-voice devices are valid only when the reader-voice content itself passes looseness_vs_padding — i.e., it updates the narrator's genuine state of judgment, hesitation, or emotion, exactly as 「そうしたかった、とは思う」does in looseness_vs_padding's good-example list.</note>
  </category>

  <category name="section_entry">
    <rule>Do not open a section with a declaration like「本節では〜を扱う」. Instead enter by one of:
      <type>Restate, as the participant's own question, the discomfort left by the previous section</type>
      <type>Write out the counter-question the reader naturally holds (「では、先に〜しておけばよかったのだろうか」); do not answer it immediately — first receive it with「そうしたかった、とは思う」, then overturn it</type>
      <type>Open with the writer's own confession (「白状すれば、〜という算段もあった」), used not for self-criticism but as footing for the argument that follows (「この算段は半分だけ正しい」)</type>
    </rule>
    <note name="reader_voice_vs_padding">See opening_design's reader_voice_vs_padding note: the counter-question device above is valid only when its reader-voice content passes the looseness_vs_padding test, not as a decorative reader-reaction restatement.</note>
    <rule>Introduce theory, concepts, or quotations only after first creating in the reader a "still-unnamed discomfort." Theory enters as a naming, not as an answer; presenting the theory first and confirming it with an example afterward robs the reader of the discovery.</rule>
    <rule>The bridge between sections belongs at the head of the next section, not the tail of the previous one. Appending a preview to a section's end is progress-narration and is padding; if the next section's head opens with a counter-question, discomfort, or confession, the reader keeps reading even without a preview.
      <bad>次は〜を見る。</bad>
    </rule>
  </category>

  <category name="enumeration_landing">
    <rule>After enumerating properties or classifications, do not leave the list hanging. Land each item one by one onto the immediately preceding concrete scene (「一つめは、さっき見た〜の正体である」「二つめにも身に覚えがある」).</rule>
    <rule>Do not make the landing style uniform. Vary it: pointing out the true identity, recognition from experience, mapping onto a specific fact, a future abandonment.</rule>
  </category>

  <category name="question_resolution_and_closing">
    <rule>Questions raised along the way must be explicitly recovered, not abandoned. Returning the answer in halves (「答えの半分がこれである」「残り半分は〜にある」) becomes propulsion for the second half.</rule>
    <rule>A closing first lands the accumulated abstraction onto a concrete the reader already has (the opening scene, the reader's own experience, an early question), then shuts. Do not end on abstraction or a general rule.</rule>
    <rule>Close tensions by choice. Leaving exactly one open at the end is allowed. Humility or delegation to the reader (「足りない部分は読者が埋めてほしい」) functions as room for the reader to participate.</rule>
    <rule>Second-person address, requests to the reader (「どうか〜と割り切って読んでほしい」), and the writer's humility or disclaimers function as looseness only at boundaries (chapter opening, closing). Do not mix them into mid-chapter argument.</rule>
  </category>

  <category name="looseness_vs_padding">
    <note>The axis of judgment is only one: does the sentence update the situation, or the document?</note>
    <rule>A situation-updating sentence newly conveys events, data, or a person's statement in the depicted world, or the narrator's state of judgment (preconception, suspension, regret, concession, confession). Keep it as looseness.</rule>
    <rule>A document-updating sentence conveys only how this chapter, section, explanation, or "the discussion so far" looks, or what will be written next. Delete it in principle.</rule>
    <rule>Typical padding (the topic is the body text itself; situation-side information is zero):
      <bad>ここまでだと、概念の説明に見えるだろう。なので、すぐに例へ戻す。</bad>
      <bad>要するに、この章の主題は〜ではなく〜である。</bad>
      <bad>誤解しないでほしいのだが、〜を否定したいわけではない。</bad>
      <bad>テクニックの列挙はしない。 / 〜の話ではない。問いは〜だけである。</bad>
      <bad>先に答えを半分だけ置く。 / 最後にもう一度だけ線を引く。</bad>
      <bad>ここまでで〜は見えた。次の問いは〜である。 / 次は〜を見る。</bad>
    </rule>
    <rule>Padding appears not only as long explanatory sentences but also as short assertions. If a document-updating sentence is reshaped into a short assertive form instead of being deleted, it looks like a well-paced punchline and tends to survive. This is the largest padding-entry route. Brevity and good rhythm are not reasons to keep a sentence. Judge beat quality only for sentences that have passed the topic test.</rule>
    <rule>Typical good looseness (each updates the situation or the narrator's state of judgment):
      <good>うまくいっているに違いない。</good>
      <good>まあ、今すぐ手を打つほどでもないのだけど、どこかの時点で整理は要るだろう。</good>
      <good>最初からわかっていたらそうしていたのに、というのが口惜しい。</good>
      <good>そうしたかった、とは思う。</good>
    </rule>
    <rule>Sentences about the document itself may be kept only in these four forms:
      <exception name="objection_handling">Deny a reader's misreading or objection by quoting it concretely in 「」 (「ここまでの話を『〜せよ』という主張と読まれると、それは違う」). The condition is that the denied target is concretely quoted. A vague「誤解しないでほしい」alone is padding.</exception>
      <exception name="question_setup_and_recovery">A boundary sentence「この章では〜を考える」(only after tension has been created) or「その答えの半分がこれである」. What may remain is the question sentence itself and the recovery sentence. Declarations of what the body is not or will not do (「〜の列挙はしない」「〜の話ではない」) are not question setup. Unless they take exception 1's form and deny a concrete misreading, delete them.</exception>
      <exception name="reader_request">A boundary request or disclaimer (「どうか〜と割り切って読んでほしい」).</exception>
      <exception name="example_frame">Sentences that open a fictional example or scene (「〜としよう」) and close it (「冒頭の例にオチを付けておこう」). They remind the reader the example is fictional and return from abstract argument to the scene. Place them at a boundary (section head). Even if the topic appears to be the body text itself, operating the example's frame is not padding.</exception>
    </rule>
    <rule>Deletion and rewrite procedure:
      <step>If a sentence updates only the document, delete it first and read the surrounding sentences; if they connect, stop there.</step>
      <step>If deletion makes the logic jump, rewrite what the sentence was trying to point at as a situation-side sentence.
        <bad>ここまでだと概念の説明に見える</bad>
        <good>この三つの性質は、どれも冒頭の失敗の中にそろっている</good>
      </step>
      <step>If the rewritten sentence still takes the body text itself as its topic (only shortened, or only rephrased), the rewrite has failed. Unless it fits one of exceptions 1–3, delete the sentence and re-bridge the surroundings.</step>
    </rule>
  </category>

  <category name="post_draft_check_procedure">
    <note>After finishing a draft, inspect mechanically in this order.</note>
    <step order="1" name="topic_test">Collect every paragraph-initial sentence and every independent short sentence, and judge whether it updates the situation or the document. Document-side sentences are deleted or rewritten unless they match one of the four exceptions. Sentences newly written or recast shorter during revision are a padding-entry route, so run this test immediately after writing them.</step>
    <step order="2" name="leak_test">Search the body for this norm's own vocabulary and example phrasing (「答えの半分」「緊張」「回収」「線を引く」「問いを〜返す」, etc.). If present, that is evidence the device was declared: delete the sentence and realize the device on the content side. Also check every section end for「次は〜」-type progress previews.</step>
    <step order="3" name="tension_ledger">List questions, preconceptions, and promises raised in the body (「答えは半分ずつ返す」, etc.) and point to each recovery location by line. If a location cannot be pointed to, write the recovery or cut the question.</step>
    <step order="4" name="beat_check">Find stretches of three or more long assertive sentences in a row, and insert short footing, a stop, or hesitation.</step>
    <step order="5" name="boundary_check">Confirm that second-person address, requests, and humility do not appear in mid-body argument. If they do, move them to a boundary or cut them.</step>
  </category>

  <diagnostics>
    <description>When diagnosing flat prose, look up the prescription from the symptom.</description>
    <symptom description="全段落が同じ調子で疲れる">
      <prescription>There is no sentence beat. Apply post_draft_check_procedure step 4 (beat_check).</prescription>
    </symptom>
    <symptom description="正しいのに読み進める気がしない">
      <prescription>There is no unresolved tension. Insert one of the opening_design types that create tension, then confirm with the tension ledger that at least one remains open thereafter.</prescription>
    </symptom>
    <symptom description="理論の節で急に温度が下がる">
      <prescription>Theory has entered before discomfort. Place a counter-question or confession before the theory, and land enumerations onto the scene one item at a time.</prescription>
    </symptom>
    <symptom description="緩い文はあるのに弛んで見える">
      <prescription>The looseness has become document-updating (progress-narration). Run the topic test and rewrite into situation-side sentences (fine differences of feeling, suspended judgment, preconception).</prescription>
    </symptom>
    <symptom description="章末が説教くさい">
      <prescription>It closes while still in abstraction. Put a sentence up front that lands on a concrete the reader already has, and end leaving one question undecided (question_resolution_and_closing).</prescription>
    </symptom>
    <symptom description="冒頭が事務的">
      <prescription>It has become an attitude-less agenda table. Rather than deleting it, give the preview sentence an attitude, or place the handling of the reader's felt sense and resistance before the preview.</prescription>
    </symptom>
  </diagnostics>
</rhythm_norms>

<concepts>
  <concept name="cognitive_mode_switch">The four alternating reader modes this skill designs for: observation (観察), hesitation (逡巡), assertion (断定), re-observation (再観察). Pacing is the deliberate switching between these, not a change in information density.</concept>
  <concept name="unresolved_tension">An unanswered question, an unverified conviction, or a promised-later answer that the text keeps open. At least one must remain open at all times; once all tension closes, the reader has no reason to keep reading.</concept>
  <concept name="situation_vs_document">The single axis for judging whether a sentence is looseness or padding: does it update the situation (the depicted world or the narrator's judgment state) or the document (how the text itself looks, or what comes next)? See rhythm_norms/looseness_vs_padding.</concept>
  <concept name="sentence_beat">The plant-flow-stop rhythm of short/long/short sentences, and the alternation of assertion and hesitation, that keeps a paragraph from reading as monotone.</concept>
  <concept name="density_wave">The alternation of dense and sparse paragraphs, and of concrete-hugging and one-level-back paragraphs, that keeps a section from reading as uniformly heavy.</concept>
</concepts>

<patterns>
  <pattern name="draft_new_prose">
    <description>Apply rhythm_norms when writing new explanatory prose from scratch</description>
    <decision_tree name="when_to_use">
      <question>Is this new Japanese explanatory or narrative prose meant to read as compelling, not merely correct?</question>
      <if_yes>Apply japanese-tech-writing's prose_norms first, then this skill's rhythm_norms categories: opening_design, section_entry, sentence_rhythm, paragraph_density_wave, enumeration_landing, question_resolution_and_closing.</if_yes>
      <if_no>Use japanese-tech-writing's prose_norms alone; pacing design is unnecessary for purely reference-style documentation.</if_no>
    </decision_tree>
  </pattern>
  <pattern name="diagnose_flat_prose">
    <description>Diagnose existing prose that reads as dense but flat</description>
    <decision_tree name="when_to_use">
      <question>Does the draft feel technically correct but tiring or unengaging to read?</question>
      <if_yes>Match the symptom against rhythm_norms/diagnostics and apply the paired prescription.</if_yes>
      <if_no>If the draft instead has correctness or hygiene issues, use japanese-tech-writing's prose_norms categories.</if_no>
    </decision_tree>
  </pattern>
  <pattern name="post_draft_mechanical_check">
    <description>Run the five-step mechanical check after any draft governed by this skill</description>
    <decision_tree name="when_to_use">
      <question>Has a full draft or revision pass just been completed?</question>
      <if_yes>Run rhythm_norms/post_draft_check_procedure steps 1-5 in order before treating the draft as done.</if_yes>
      <if_no>Continue drafting; the check procedure requires a complete draft to be meaningful.</if_no>
    </decision_tree>
  </pattern>
</patterns>

<best_practices>
<practice priority="critical">
<description>Apply japanese-tech-writing's prose_norms before this skill</description>
<technique>The two are complementary (correctness/rigor vs. pacing/tension) and do not conflict — both independently forbid empty topic-announcement sentences like 「本章ではA、B、Cを扱う」</technique>
</practice>
<practice priority="critical">
<description>Keep at least one unresolved tension open at all times</description>
<technique>Close tensions deliberately, and leave exactly one open at the very end where appropriate</technique>
</practice>
<practice priority="critical">
<description>Draw all beat, tension, and looseness material from the situation side only</description>
<technique>When the situation offers no material at a given position, leave it flat instead of adding text</technique>
</practice>
<practice priority="high">
<description>Realize this skill's own devices through content</description>
<technique>Never declare a device's name or operation in the body text; catch leaks with the leak test</technique>
</practice>
<practice priority="high">
<description>Run the topic test on every paragraph-initial and independent short sentence</description>
<technique>Apply it especially to sentences newly written or shortened during revision, since that is the largest padding-entry route</technique>
</practice>
<practice priority="medium">
<description>Run the full five-step post-draft check procedure before treating a draft as finished</description>
<technique>topic_test, leak_test, tension_ledger, beat_check, boundary_check in order</technique>
</practice>
</best_practices>

<anti_patterns>
<avoid name="document_narration">
<description>Sentences that narrate how the text itself looks or what will be written next</description>
<instead>Delete, or rewrite into a situation-side sentence carrying new information about the object or the narrator's judgment state (see rhythm_norms/looseness_vs_padding)</instead>
</avoid>
<avoid name="declared_device">
<description>Naming this norm's own devices in the body text instead of realizing them</description>
<instead>Realize the device through content (write the half-answer itself) without announcing the operation</instead>
</avoid>
<avoid name="tail_end_preview">
<description>Appending a progress preview to a section's end</description>
<instead>Open the next section's head with a counter-question, discomfort, or confession instead</instead>
</avoid>
<avoid name="attitudeless_agenda">
<description>An opening or section head that lists topics with no attitude</description>
<instead>Give the preview an attitude, or precede it with the reader's felt sense and resistance</instead>
</avoid>
<avoid name="short_sentence_bias">
<description>Cutting sentences merely to produce a beat, including context the reader needs (scope, viewpoint, comparison axes, unsettled matters)</description>
<instead>Only raise density on top of already-shared context; keep necessary context intact</instead>
</avoid>
<avoid name="padding_disguised_as_punchline">
<description>Reshaping a document-updating sentence into a short assertive form so it reads as a well-paced punchline instead of deleting it</description>
<instead>Judge a sentence's beat quality only after it has passed the topic test; brevity alone is not a reason to keep it</instead>
</avoid>
</anti_patterns>

<rules priority="critical">
  <rule>Apply japanese-tech-writing's prose_norms first, then this skill's rhythm_norms</rule>
  <rule>Draw all pacing material from the situation side only; never fabricate tension or beat via document-narration</rule>
  <rule>Run the topic test (situation vs. document) on every paragraph-initial and independent short sentence before treating a draft as final</rule>
</rules>

<rules priority="standard">
  <rule>Keep at least one unresolved tension open until deliberately recovered</rule>
  <rule>Realize this skill's own devices through content; never declare them in the body text</rule>
  <rule>Run the full five-step post-draft check procedure (topic test, leak test, tension ledger, beat check, boundary check)</rule>
  <rule>Reserve second-person address, reader requests, and writer reticence for chapter and section boundaries only</rule>
</rules>

<error_escalation inherits="core-patterns#error_escalation">
<examples>
<example severity="low">A single paragraph reads slightly flat</example>
<example severity="medium">A whole section has no unresolved tension and risks losing the reader</example>
<example severity="high">This skill's own device vocabulary leaks into the body text (leak test failure)</example>
<example severity="critical">The draft substitutes progress-narration for tension throughout, making padding indistinguishable from content</example>
</examples>
</error_escalation>

<constraints>
  <must>Apply japanese-tech-writing's prose_norms before this skill's rhythm_norms</must>
  <must>Keep every Japanese bad/good/example excerpt verbatim; do not paraphrase or translate them</must>
  <must>Run the topic test on newly written or reshaped sentences immediately after writing them</must>
  <avoid>Manufacturing tension or beat through document-narration instead of situation-side material</avoid>
  <avoid>Declaring this skill's devices in body text instead of realizing them through content</avoid>
  <avoid>Cutting context-carrying sentences merely to produce a shorter beat</avoid>
</constraints>

<related_skills>
<skill name="japanese-tech-writing">Prerequisite and companion skill; apply its prose_norms for correctness and hygiene before applying this skill's pacing and tension norms</skill>
</related_skills>

<related_agents>
<agent name="docs">Primary agent for technical article and book generation</agent>
</related_agents>
