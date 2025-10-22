;; -*- lexical-binding: t; -*-

(voice-setup-add-map
 '(
   (telega-entity-type-blockquote voice-smoothen)
   (telega-entity-type-bold voice-bolden)
   (telega-entity-type-botcommand voice-animate-extra)
   (telega-entity-type-cashtag voice-brighten)
   (telega-entity-type-code voice-lighten)
   (telega-entity-type-hashtag voice-brighten-extra)
   (telega-entity-type-italic voice-animate)
   (telega-entity-type-mention voice-overlay-1)
   (telega-msg-self-title voice-annotate)
   (telega-msg-user-title voice-bolden-extra)
   (telega-user-non-online-status voice-smoothen)
   (telega-user-non-online-status voice-bolden-and-animate)
   ))
