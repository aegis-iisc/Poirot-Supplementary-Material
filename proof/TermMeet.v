Set Warnings "-notation-overridden,-parsing".

From CT Require Import Maps.
From CT Require Import CoreLang.
From CT Require Import NormalTypeSystem.
From CT Require Import LinearContext.
From CT Require Import RfTypeDef.
From CT Require Import TypeClosed.
From CT Require Import Denotation.
From CT Require Import WellFormed.
From Coq Require Import Logic.FunctionalExtensionality.
From Coq Require Import Logic.ClassicalFacts.
From Coq Require Import Lists.List.
From Coq Require Import FunInd.
From Coq Require Import Recdef.

Import CoreLang.
Import NormalTypeSystem.
Import LinearContext.
Import NoDup.
Import Ax.
Import RfTypeDef.
Import TypeClosed.
Import Denotation.
Import WellFormed.
Import ListNotations.

Lemma meet_of_two_terms_term_order: forall e1 e2 e3 T,
    empty \N- e1 \Tin T -> empty \N- e2 \Tin T -> empty \N- e3 \Tin T ->
    (forall c, e3 -->* c <-> e1 -->* c /\ e2 -->* c) -> (e3 <-< e1) /\ (e3 <-< e2).
Proof with eauto.
  intros.
  split.
  - split... intros. rewrite H2 in H3... destruct H3...
    intros. apply weakening_empty with (Gamma := Gamma) in H1.
    assert (T0 = T). eapply ty_unique... subst... eapply  weakening_empty...
  - split... intros. rewrite H2 in H3... destruct H3...
    intros. apply weakening_empty with (Gamma := Gamma) in H1.
    assert (T0 = T). eapply ty_unique... subst... eapply  weakening_empty...
Qed.

Lemma meet_of_three_terms_exists: forall e1 e2 e3 T,
    empty \N- e1 \Tin T -> empty \N- e2 \Tin T -> empty \N- e3 \Tin T ->
    (exists e, (empty \N- e \Tin T) /\
            (forall c, e -->* c <-> e1 -->* c /\ e2 -->* c /\ e3 -->* c)).
Proof with eauto.
  intros.
  destruct (meet_of_two_terms_exists e1 e2 T) as (e4 & HTe4 & HEe4)...
  destruct (meet_of_two_terms_exists e4 e3 T) as (e5 & HTe5 & HEe5)...
  exists e5. split...
  intro c. split... intros... apply HEe5 in H2. destruct H2. apply HEe4 in H2. destruct H2...
  intros. rewrite HEe5. destruct H2 as (H21 & H22 & H23)... split... apply HEe4...
Qed.

Lemma meet_of_three_terms_term_order: forall e1 e2 e3 e T,
    empty \N- e1 \Tin T -> empty \N- e2 \Tin T -> empty \N- e3 \Tin T -> empty \N- e \Tin T ->
    (forall c, e -->* c <-> e1 -->* c /\ e2 -->* c /\ e3 -->* c) -> (e <-< e1) /\ (e <-< e2) /\ (e <-< e3).
Proof with eauto.
  intros.
  split.
  - split... intros. rewrite H3 in H4... destruct H4...
    intros. apply weakening_empty with (Gamma := Gamma) in H2.
    assert (T0 = T). eapply ty_unique... subst... eapply  weakening_empty...
  - split...
    split...
    intros. rewrite H3 in H4... destruct H4... destruct H5...
    intros. assert (Gamma \N- e \Tin T). eapply weakening_empty in H2...
    assert (T = T0). eapply ty_unique... subst... eapply  weakening_empty...
    split...
    intros. rewrite H3 in H4... destruct H4... destruct H5...
    intros. assert (Gamma \N- e \Tin T). eapply weakening_empty in H2...
    assert (T = T0). eapply ty_unique... subst... eapply  weakening_empty...
Qed.


Lemma meet_of_four_terms_exists: forall e1 e2 e3 e4 T,
    empty \N- e1 \Tin T -> empty \N- e2 \Tin T -> empty \N- e3 \Tin T -> empty \N- e4 \Tin T ->
    (exists e, (empty \N- e \Tin T) /\
            (forall c, e -->* c <-> e1 -->* c /\ e2 -->* c /\ e3 -->* c /\ e4 -->* c)).
Proof with eauto.
  intros.
  destruct (meet_of_three_terms_exists e1 e2 e3 T) as (e123 & HTe123 & HEe123)...
  destruct (meet_of_two_terms_exists e123 e4 T) as (e & HTe & HEe)...
  exists e. split...
  intro c. split... intros... apply HEe in H3. destruct H3. apply HEe123 in H3... destruct H3 as (Ha & Hb & Hc)...
  intros. rewrite HEe. destruct H3 as (H21 & H22 & H23 & H4)... split... apply HEe123...
Qed.

Lemma meet_of_four_terms_term_order: forall e1 e2 e3 e4 e T,
    empty \N- e1 \Tin T -> empty \N- e2 \Tin T -> empty \N- e3 \Tin T -> empty \N- e4 \Tin T -> empty \N- e \Tin T ->
    (forall c, e -->* c <-> e1 -->* c /\ e2 -->* c /\ e3 -->* c /\ e4 -->* c) -> (e <-< e1) /\ (e <-< e2) /\ (e <-< e3) /\ (e <-< e4).
Proof with eauto.
  intros.
  split.
  - split... intros. rewrite H4 in H5... destruct H5...
    intros. apply weakening_empty with (Gamma := Gamma) in H3.
    assert (T0 = T). eapply ty_unique... subst... eapply  weakening_empty...
  - split...
    split...
    intros. rewrite H4 in H5... destruct H5... destruct H6...
    intros. apply weakening_empty with (Gamma := Gamma) in H3.
    assert (T0 = T). eapply ty_unique... subst... eapply  weakening_empty...
    split...
    split. intros. rewrite H4 in H5... destruct H5... destruct H6... destruct H7...
    intros. apply weakening_empty with (Gamma := Gamma) in H3.
    assert (T0 = T). eapply ty_unique... subst... eapply  weakening_empty...
    split. intros. rewrite H4 in H5... destruct H5... destruct H6... destruct H7...
    intros. apply weakening_empty with (Gamma := Gamma) in H3.
    assert (T0 = T). eapply ty_unique... subst... eapply  weakening_empty...
Qed.
