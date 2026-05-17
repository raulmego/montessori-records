-- SEED: Currículo Taller I y II — generado automáticamente del Excel
-- Presentaciones: 880

-- === Lenguaje ===
do $block$
declare
  v_plane_i uuid;
  v_plane_ii uuid;
  v_area_i uuid;
  v_area_ii uuid;
  v_cat_i uuid;
  v_cat_ii uuid;
begin
  select id into v_plane_i from development_planes where slug = 'taller-i';
  select id into v_plane_ii from development_planes where slug = 'taller-ii';

  insert into curriculum_areas (plane_id, name, color, sort_order)
    values (v_plane_i, 'Lenguaje', '#6366f1', 1)
    on conflict do nothing
    returning id into v_area_i;
  if v_area_i is null then
    select id into v_area_i from curriculum_areas where plane_id = v_plane_i and name = 'Lenguaje';
  end if;

  insert into curriculum_areas (plane_id, name, color, sort_order)
    values (v_plane_ii, 'Lenguaje', '#6366f1', 1)
    on conflict do nothing
    returning id into v_area_ii;
  if v_area_ii is null then
    select id into v_area_ii from curriculum_areas where plane_id = v_plane_ii and name = 'Lenguaje';
  end if;

  insert into curriculum_categories (area_id, name, sort_order)
    values (v_area_i, 'Lenguaje', 0)
    on conflict do nothing
    returning id into v_cat_i;
  if v_cat_i is null then
    select id into v_cat_i from curriculum_categories where area_id = v_area_i and name = 'Lenguaje';
  end if;

  insert into curriculum_categories (area_id, name, sort_order)
    values (v_area_ii, 'Lenguaje', 0)
    on conflict do nothing
    returning id into v_cat_ii;
  if v_cat_ii is null then
    select id into v_cat_ii from curriculum_categories where area_id = v_area_ii and name = 'Lenguaje';
  end if;

  -- Comunicación en signos (g.l)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Comunicación en signos (g.l)', 'taller_i', 0, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Comunicación en signos (g.l)', 'taller_i', 0, null)
    on conflict do nothing;
  -- Historia del lenguaje escrito
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Historia del lenguaje escrito', 'taller_i', 1, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Historia del lenguaje escrito', 'taller_i', 1, null)
    on conflict do nothing;
  -- Historia del lenguaje hablado
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Historia del lenguaje hablado', 'taller_i', 2, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Historia del lenguaje hablado', 'taller_i', 2, null)
    on conflict do nothing;
  -- Introducción a los afijos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción a los afijos', 'taller_i', 3, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción a los afijos', 'taller_i', 3, null)
    on conflict do nothing;
  -- Sufijos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Sufijos', 'taller_i', 4, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Sufijos', 'taller_i', 4, null)
    on conflict do nothing;
  -- La raíz
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'La raíz', 'taller_i', 5, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'La raíz', 'taller_i', 5, null)
    on conflict do nothing;
  -- Prefijos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Prefijos', 'taller_i', 6, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Prefijos', 'taller_i', 6, null)
    on conflict do nothing;
  -- Palabras compuestas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Palabras compuestas', 'taller_i', 7, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Palabras compuestas', 'taller_i', 7, null)
    on conflict do nothing;
  -- Familia de las palabras
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Familia de las palabras', 'taller_i', 8, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Familia de las palabras', 'taller_i', 8, null)
    on conflict do nothing;
  -- Introducción a la gramático
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción a la gramático', 'taller_i', 9, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción a la gramático', 'taller_i', 9, null)
    on conflict do nothing;
  -- Introducción oral al Sustantivo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción oral al Sustantivo', 'both', 10, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción oral al Sustantivo', 'both', 10, null)
    on conflict do nothing;
  -- Presentación del material del Sustantivo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Presentación del material del Sustantivo', 'both', 11, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Presentación del material del Sustantivo', 'both', 11, null)
    on conflict do nothing;
  -- Órdenes del material del Sustantivo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Órdenes del material del Sustantivo', 'both', 12, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Órdenes del material del Sustantivo', 'both', 12, null)
    on conflict do nothing;
  -- Caja gramatical II
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Caja gramatical II', 'taller_i', 13, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Caja gramatical II', 'taller_i', 13, null)
    on conflict do nothing;
  -- Artículo y Sustantivo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Artículo y Sustantivo', 'both', 14, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Artículo y Sustantivo', 'both', 14, null)
    on conflict do nothing;
  -- Artículo definido e indefinido
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Artículo definido e indefinido', 'both', 15, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Artículo definido e indefinido', 'both', 15, null)
    on conflict do nothing;
  -- Singular y plural
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Singular y plural', 'both', 16, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Singular y plural', 'both', 16, null)
    on conflict do nothing;
  -- Masculino y femenino
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Masculino y femenino', 'both', 17, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Masculino y femenino', 'both', 17, null)
    on conflict do nothing;
  -- Común y propio
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Común y propio', 'both', 18, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Común y propio', 'both', 18, null)
    on conflict do nothing;
  -- Abstracto y concreto
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Abstracto y concreto', 'both', 19, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Abstracto y concreto', 'both', 19, null)
    on conflict do nothing;
  -- Individual y colectivo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Individual y colectivo', 'both', 20, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Individual y colectivo', 'both', 20, null)
    on conflict do nothing;
  -- Clasificación de Sust. Abst.
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Clasificación de Sust. Abst.', 'both', 21, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Clasificación de Sust. Abst.', 'both', 21, null)
    on conflict do nothing;
  -- Cartelón de clasif. De sustantivos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cartelón de clasif. De sustantivos', 'both', 22, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cartelón de clasif. De sustantivos', 'both', 22, null)
    on conflict do nothing;
  -- Símbolos de gramatica avanzada
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Símbolos de gramatica avanzada', 'both', 23, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Símbolos de gramatica avanzada', 'both', 23, null)
    on conflict do nothing;
  -- Caja gramatical III Adjetivo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Caja gramatical III Adjetivo', 'taller_i', 24, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Caja gramatical III Adjetivo', 'taller_i', 24, null)
    on conflict do nothing;
  -- Introducción oral
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción oral', 'both', 25, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción oral', 'both', 25, null)
    on conflict do nothing;
  -- Presentación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Presentación', 'both', 26, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Presentación', 'both', 26, null)
    on conflict do nothing;
  -- Cartelón de clasif. De adjetivos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cartelón de clasif. De adjetivos', 'both', 27, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cartelón de clasif. De adjetivos', 'both', 27, null)
    on conflict do nothing;
  -- Comparación de Adjetivos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Comparación de Adjetivos', 'both', 28, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Comparación de Adjetivos', 'both', 28, null)
    on conflict do nothing;
  -- Caja gramatical IV Verbo, Introducción
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Caja gramatical IV Verbo, Introducción', 'taller_i', 29, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Caja gramatical IV Verbo, Introducción', 'taller_i', 29, null)
    on conflict do nothing;
  -- Introducción oral
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción oral', 'both', 30, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción oral', 'both', 30, null)
    on conflict do nothing;
  -- Presentación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Presentación', 'both', 31, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Presentación', 'both', 31, null)
    on conflict do nothing;
  -- Permutaciones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Permutaciones', 'both', 32, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Permutaciones', 'both', 32, null)
    on conflict do nothing;
  -- Órdenes del verbo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Órdenes del verbo', 'both', 33, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Órdenes del verbo', 'both', 33, null)
    on conflict do nothing;
  -- Sinónimos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Sinónimos', 'both', 34, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Sinónimos', 'both', 34, null)
    on conflict do nothing;
  -- Caja gramatical V preposición
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Caja gramatical V preposición', 'taller_i', 35, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Caja gramatical V preposición', 'taller_i', 35, null)
    on conflict do nothing;
  -- Historia
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Historia', 'both', 36, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Historia', 'both', 36, null)
    on conflict do nothing;
  -- Introducción oral
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción oral', 'both', 37, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción oral', 'both', 37, null)
    on conflict do nothing;
  -- Presentación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Presentación', 'both', 38, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Presentación', 'both', 38, null)
    on conflict do nothing;
  -- Permutaciones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Permutaciones', 'both', 39, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Permutaciones', 'both', 39, null)
    on conflict do nothing;
  -- Caja gramatical VI adverbio, Introducción
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Caja gramatical VI adverbio, Introducción', 'taller_i', 40, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Caja gramatical VI adverbio, Introducción', 'taller_i', 40, null)
    on conflict do nothing;
  -- Introducción oral
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción oral', 'both', 41, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción oral', 'both', 41, null)
    on conflict do nothing;
  -- Presentación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Presentación', 'both', 42, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Presentación', 'both', 42, null)
    on conflict do nothing;
  -- Permutaciones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Permutaciones', 'both', 43, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Permutaciones', 'both', 43, null)
    on conflict do nothing;
  -- Órdenes del adverbio
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Órdenes del adverbio', 'both', 44, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Órdenes del adverbio', 'both', 44, null)
    on conflict do nothing;
  -- Clasificación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Clasificación', 'both', 45, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Clasificación', 'both', 45, null)
    on conflict do nothing;
  -- Caja gramatical VII pronombre
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Caja gramatical VII pronombre', 'taller_i', 46, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Caja gramatical VII pronombre', 'taller_i', 46, null)
    on conflict do nothing;
  -- Introducción oral
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción oral', 'both', 47, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción oral', 'both', 47, null)
    on conflict do nothing;
  -- Presentación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Presentación', 'both', 48, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Presentación', 'both', 48, null)
    on conflict do nothing;
  -- Cartelón
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cartelón', 'both', 49, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cartelón', 'both', 49, null)
    on conflict do nothing;
  -- Permutaciones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Permutaciones', 'both', 50, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Permutaciones', 'both', 50, null)
    on conflict do nothing;
  -- Órdenes
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Órdenes', 'both', 51, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Órdenes', 'both', 51, null)
    on conflict do nothing;
  -- Clasificación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Clasificación', 'both', 52, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Clasificación', 'both', 52, null)
    on conflict do nothing;
  -- Caja gramatical VIII conjunción
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Caja gramatical VIII conjunción', 'taller_i', 53, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Caja gramatical VIII conjunción', 'taller_i', 53, null)
    on conflict do nothing;
  -- Introducción oral
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción oral', 'both', 54, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción oral', 'both', 54, null)
    on conflict do nothing;
  -- Presentación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Presentación', 'both', 55, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Presentación', 'both', 55, null)
    on conflict do nothing;
  -- Permutaciones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Permutaciones', 'both', 56, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Permutaciones', 'both', 56, null)
    on conflict do nothing;
  -- Órdenes
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Órdenes', 'both', 57, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Órdenes', 'both', 57, null)
    on conflict do nothing;
  -- Clasificación de conjunciones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Clasificación de conjunciones', 'both', 58, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Clasificación de conjunciones', 'both', 58, null)
    on conflict do nothing;
  -- Caja gramatical IX Interjección
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Caja gramatical IX Interjección', 'taller_i', 59, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Caja gramatical IX Interjección', 'taller_i', 59, null)
    on conflict do nothing;
  -- Introducción oral
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción oral', 'both', 60, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción oral', 'both', 60, null)
    on conflict do nothing;
  -- Presentación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Presentación', 'both', 61, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Presentación', 'both', 61, null)
    on conflict do nothing;
  -- Asp. Del Verbo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Asp. Del Verbo', 'both', 62, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Asp. Del Verbo', 'both', 62, null)
    on conflict do nothing;
  -- Pronombres personales
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Pronombres personales', 'taller_ii', 63, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Pronombres personales', 'taller_ii', 63, null)
    on conflict do nothing;
  -- Introducción oral (cartelones)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción oral (cartelones)', 'both', 64, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción oral (cartelones)', 'both', 64, null)
    on conflict do nothing;
  -- Ejercicio con tarjetas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Ejercicio con tarjetas', 'both', 65, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Ejercicio con tarjetas', 'both', 65, null)
    on conflict do nothing;
  -- Dictado
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Dictado', 'both', 66, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Dictado', 'both', 66, null)
    on conflict do nothing;
  -- Tiempos simples
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tiempos simples', 'taller_ii', 67, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tiempos simples', 'taller_ii', 67, null)
    on conflict do nothing;
  -- Presente
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Presente', 'both', 68, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Presente', 'both', 68, null)
    on conflict do nothing;
  -- Introducción oral
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción oral', 'both', 69, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción oral', 'both', 69, null)
    on conflict do nothing;
  -- Actividad con tarjetas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Actividad con tarjetas', 'both', 70, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Actividad con tarjetas', 'both', 70, null)
    on conflict do nothing;
  -- Pasado
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Pasado', 'both', 71, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Pasado', 'both', 71, null)
    on conflict do nothing;
  -- Introducción oral
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción oral', 'both', 72, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción oral', 'both', 72, null)
    on conflict do nothing;
  -- Actividad con tarjetas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Actividad con tarjetas', 'both', 73, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Actividad con tarjetas', 'both', 73, null)
    on conflict do nothing;
  -- Futuro
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Futuro', 'both', 74, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Futuro', 'both', 74, null)
    on conflict do nothing;
  -- Introducción oral
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción oral', 'both', 75, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción oral', 'both', 75, null)
    on conflict do nothing;
  -- Actividad con tarjetas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Actividad con tarjetas', 'both', 76, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Actividad con tarjetas', 'both', 76, null)
    on conflict do nothing;
  -- Tiempo copretérito
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tiempo copretérito', 'both', 77, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tiempo copretérito', 'both', 77, null)
    on conflict do nothing;
  -- Introducción oral
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción oral', 'both', 78, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción oral', 'both', 78, null)
    on conflict do nothing;
  -- Presentación con tarjetas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Presentación con tarjetas', 'both', 79, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Presentación con tarjetas', 'both', 79, null)
    on conflict do nothing;
  -- Tiempo pospretérito
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tiempo pospretérito', 'both', 80, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tiempo pospretérito', 'both', 80, null)
    on conflict do nothing;
  -- Introducción oral
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción oral', 'both', 81, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción oral', 'both', 81, null)
    on conflict do nothing;
  -- Presentación con tarjetas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Presentación con tarjetas', 'both', 82, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Presentación con tarjetas', 'both', 82, null)
    on conflict do nothing;
  -- Verbos auxiliares
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Verbos auxiliares', 'both', 83, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Verbos auxiliares', 'both', 83, null)
    on conflict do nothing;
  -- Presentación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Presentación', 'both', 84, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Presentación', 'both', 84, null)
    on conflict do nothing;
  -- Tiempos compuestos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tiempos compuestos', 'taller_ii', 85, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tiempos compuestos', 'taller_ii', 85, null)
    on conflict do nothing;
  -- Antepresente
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Antepresente', 'both', 86, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Antepresente', 'both', 86, null)
    on conflict do nothing;
  -- Introducción oral
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción oral', 'both', 87, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción oral', 'both', 87, null)
    on conflict do nothing;
  -- Presentación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Presentación', 'both', 88, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Presentación', 'both', 88, null)
    on conflict do nothing;
  -- Antepasado
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Antepasado', 'both', 89, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Antepasado', 'both', 89, null)
    on conflict do nothing;
  -- Introducción oral
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción oral', 'both', 90, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción oral', 'both', 90, null)
    on conflict do nothing;
  -- Presentación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Presentación', 'both', 91, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Presentación', 'both', 91, null)
    on conflict do nothing;
  -- Antefuturo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Antefuturo', 'both', 92, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Antefuturo', 'both', 92, null)
    on conflict do nothing;
  -- Introducción oral
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción oral', 'both', 93, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción oral', 'both', 93, null)
    on conflict do nothing;
  -- Presentación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Presentación', 'both', 94, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Presentación', 'both', 94, null)
    on conflict do nothing;
  -- Antecopretérito
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Antecopretérito', 'both', 95, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Antecopretérito', 'both', 95, null)
    on conflict do nothing;
  -- Presentación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Presentación', 'both', 96, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Presentación', 'both', 96, null)
    on conflict do nothing;
  -- Dictado
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Dictado', 'both', 97, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Dictado', 'both', 97, null)
    on conflict do nothing;
  -- Antepospretérito
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Antepospretérito', 'both', 98, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Antepospretérito', 'both', 98, null)
    on conflict do nothing;
  -- Presentación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Presentación', 'both', 99, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Presentación', 'both', 99, null)
    on conflict do nothing;
  -- Dictado
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Dictado', 'both', 100, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Dictado', 'both', 100, null)
    on conflict do nothing;
  -- Modos de los verbos y verboides
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Modos de los verbos y verboides', 'taller_ii', 101, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Modos de los verbos y verboides', 'taller_ii', 101, null)
    on conflict do nothing;
  -- Infinitivo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Infinitivo', 'both', 102, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Infinitivo', 'both', 102, null)
    on conflict do nothing;
  -- Participio
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Participio', 'both', 103, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Participio', 'both', 103, null)
    on conflict do nothing;
  -- Gerundio
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Gerundio', 'both', 104, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Gerundio', 'both', 104, null)
    on conflict do nothing;
  -- Modos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Modos', 'both', 105, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Modos', 'both', 105, null)
    on conflict do nothing;
  -- Indicativo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Indicativo', 'both', 106, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Indicativo', 'both', 106, null)
    on conflict do nothing;
  -- Imperativo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Imperativo', 'both', 107, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Imperativo', 'both', 107, null)
    on conflict do nothing;
  -- Subjuntivo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Subjuntivo', 'both', 108, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Subjuntivo', 'both', 108, null)
    on conflict do nothing;
  -- Análisis lógico
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Análisis lógico', 'taller_ii', 109, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Análisis lógico', 'taller_ii', 109, null)
    on conflict do nothing;
  -- Oraciones simples
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Oraciones simples', 'taller_ii', 110, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Oraciones simples', 'taller_ii', 110, null)
    on conflict do nothing;
  -- Oraciones simples con extensión
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Oraciones simples con extensión', 'taller_ii', 111, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Oraciones simples con extensión', 'taller_ii', 111, null)
    on conflict do nothing;
  -- Tres o más extenciones adverbiales
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tres o más extenciones adverbiales', 'both', 112, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tres o más extenciones adverbiales', 'both', 112, null)
    on conflict do nothing;
  -- Objeto indirecto
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Objeto indirecto', 'both', 113, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Objeto indirecto', 'both', 113, null)
    on conflict do nothing;
  -- Atributivos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Atributivos', 'both', 114, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Atributivos', 'both', 114, null)
    on conflict do nothing;
  -- Sustantivos en oposición
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Sustantivos en oposición', 'both', 115, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Sustantivos en oposición', 'both', 115, null)
    on conflict do nothing;
  -- Segundo nivel: Cartelón "A"
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Segundo nivel: Cartelón "A"', 'both', 116, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Segundo nivel: Cartelón "A"', 'both', 116, null)
    on conflict do nothing;
  -- Tercer nivel: Flechas con solo nombre
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tercer nivel: Flechas con solo nombre', 'both', 117, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tercer nivel: Flechas con solo nombre', 'both', 117, null)
    on conflict do nothing;
  -- Cuarto nivel: oraciones propias
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cuarto nivel: oraciones propias', 'both', 118, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cuarto nivel: oraciones propias', 'both', 118, null)
    on conflict do nothing;
  -- Otros aspectos de las oraciones simples
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Otros aspectos de las oraciones simples', 'taller_ii', 119, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Otros aspectos de las oraciones simples', 'taller_ii', 119, null)
    on conflict do nothing;
  -- Predicado verbal y nominal
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Predicado verbal y nominal', 'both', 120, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Predicado verbal y nominal', 'both', 120, null)
    on conflict do nothing;
  -- Oraciones elípticas (sujeto tácito)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Oraciones elípticas (sujeto tácito)', 'both', 121, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Oraciones elípticas (sujeto tácito)', 'both', 121, null)
    on conflict do nothing;
  -- Orden de las palabras en las oraciones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Orden de las palabras en las oraciones', 'both', 122, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Orden de las palabras en las oraciones', 'both', 122, null)
    on conflict do nothing;
  -- Voz del verbo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Voz del verbo', 'both', 123, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Voz del verbo', 'both', 123, null)
    on conflict do nothing;
  -- Voz activa y voz pasiva
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Voz activa y voz pasiva', 'both', 124, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Voz activa y voz pasiva', 'both', 124, null)
    on conflict do nothing;
  -- Verbo transitivo e intransitivo, presente
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Verbo transitivo e intransitivo, presente', 'both', 125, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Verbo transitivo e intransitivo, presente', 'both', 125, null)
    on conflict do nothing;
  -- Cualidad reflexiva
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cualidad reflexiva', 'both', 126, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cualidad reflexiva', 'both', 126, null)
    on conflict do nothing;
  -- Oraciones compuestas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Oraciones compuestas', 'taller_ii', 127, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Oraciones compuestas', 'taller_ii', 127, null)
    on conflict do nothing;
  -- Presentación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Presentación', 'both', 128, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Presentación', 'both', 128, null)
    on conflict do nothing;
  -- Utilizando las comas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Utilizando las comas', 'both', 129, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Utilizando las comas', 'both', 129, null)
    on conflict do nothing;
  -- Conjunción subordinada
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Conjunción subordinada', 'both', 130, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Conjunción subordinada', 'both', 130, null)
    on conflict do nothing;
  -- Oraciones complejas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Oraciones complejas', 'taller_ii', 131, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Oraciones complejas', 'taller_ii', 131, null)
    on conflict do nothing;
  -- Introducción oral
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción oral', 'both', 132, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción oral', 'both', 132, null)
    on conflict do nothing;
  -- Cláusula adjetivada
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cláusula adjetivada', 'both', 133, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cláusula adjetivada', 'both', 133, null)
    on conflict do nothing;
  -- Cláusulas adverbiales
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cláusulas adverbiales', 'both', 134, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cláusulas adverbiales', 'both', 134, null)
    on conflict do nothing;
  -- Cláusulas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cláusulas', 'both', 135, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cláusulas', 'both', 135, null)
    on conflict do nothing;
  -- Otros conceptos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Otros conceptos', 'both', 136, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Otros conceptos', 'both', 136, null)
    on conflict do nothing;
  -- Uso de mayúsculas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Uso de mayúsculas', 'both', 137, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Uso de mayúsculas', 'both', 137, null)
    on conflict do nothing;
  -- Abreviaturas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Abreviaturas', 'both', 138, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Abreviaturas', 'both', 138, null)
    on conflict do nothing;
  -- Siglas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Siglas', 'both', 139, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Siglas', 'both', 139, null)
    on conflict do nothing;
  -- Acrónimos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Acrónimos', 'both', 140, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Acrónimos', 'both', 140, null)
    on conflict do nothing;
  -- Antónimos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Antónimos', 'both', 141, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Antónimos', 'both', 141, null)
    on conflict do nothing;
  -- Sinónimos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Sinónimos', 'both', 142, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Sinónimos', 'both', 142, null)
    on conflict do nothing;
  -- Homófonas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Homófonas', 'both', 143, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Homófonas', 'both', 143, null)
    on conflict do nothing;
  -- Homógrafas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Homógrafas', 'both', 144, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Homógrafas', 'both', 144, null)
    on conflict do nothing;
  -- Homónimas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Homónimas', 'both', 145, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Homónimas', 'both', 145, null)
    on conflict do nothing;
  -- División silábica
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'División silábica', 'both', 146, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'División silábica', 'both', 146, null)
    on conflict do nothing;
  -- Clasificación de palabras por sílaba
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Clasificación de palabras por sílaba', 'both', 147, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Clasificación de palabras por sílaba', 'both', 147, null)
    on conflict do nothing;
  -- Sílaba tónica
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Sílaba tónica', 'both', 148, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Sílaba tónica', 'both', 148, null)
    on conflict do nothing;
  -- Acento gráfico
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Acento gráfico', 'both', 149, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Acento gráfico', 'both', 149, null)
    on conflict do nothing;
  -- Prosódico
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Prosódico', 'both', 150, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Prosódico', 'both', 150, null)
    on conflict do nothing;
  -- Diacrítico
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Diacrítico', 'both', 151, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Diacrítico', 'both', 151, null)
    on conflict do nothing;
  -- Clasificación de palabras por acento
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Clasificación de palabras por acento', 'both', 152, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Clasificación de palabras por acento', 'both', 152, null)
    on conflict do nothing;
  -- Signos de exclamación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Signos de exclamación', 'both', 153, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Signos de exclamación', 'both', 153, null)
    on conflict do nothing;
  -- Signos de interrogación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Signos de interrogación', 'both', 154, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Signos de interrogación', 'both', 154, null)
    on conflict do nothing;
  -- Puntuación:
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Puntuación:', 'both', 155, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Puntuación:', 'both', 155, null)
    on conflict do nothing;
  -- Punto
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Punto', 'both', 156, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Punto', 'both', 156, null)
    on conflict do nothing;
  -- Coma
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Coma', 'both', 157, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Coma', 'both', 157, null)
    on conflict do nothing;
  -- Dos puntos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Dos puntos', 'both', 158, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Dos puntos', 'both', 158, null)
    on conflict do nothing;
  -- Puntos suspensivos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Puntos suspensivos', 'both', 159, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Puntos suspensivos', 'both', 159, null)
    on conflict do nothing;
  -- Paréntesis
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Paréntesis', 'both', 160, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Paréntesis', 'both', 160, null)
    on conflict do nothing;
  -- Guión
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Guión', 'both', 161, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Guión', 'both', 161, null)
    on conflict do nothing;
  -- Comillas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Comillas', 'both', 162, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Comillas', 'both', 162, null)
    on conflict do nothing;
  -- Manejo de información:
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Manejo de información:', 'taller_ii', 163, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Manejo de información:', 'taller_ii', 163, null)
    on conflict do nothing;
  -- Idea principal
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Idea principal', 'both', 164, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Idea principal', 'both', 164, null)
    on conflict do nothing;
  -- Ideas secundarias
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Ideas secundarias', 'both', 165, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Ideas secundarias', 'both', 165, null)
    on conflict do nothing;
  -- Tipos de textos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tipos de textos', 'taller_ii', 166, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tipos de textos', 'taller_ii', 166, null)
    on conflict do nothing;
  -- Mapas mentales
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Mapas mentales', 'both', 167, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Mapas mentales', 'both', 167, null)
    on conflict do nothing;
  -- Cuadro sinóptico
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cuadro sinóptico', 'both', 168, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cuadro sinóptico', 'both', 168, null)
    on conflict do nothing;
  -- Textos literarios:
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Textos literarios:', 'both', 169, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Textos literarios:', 'both', 169, null)
    on conflict do nothing;
  -- Metáfora
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Metáfora', 'both', 170, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Metáfora', 'both', 170, null)
    on conflict do nothing;
  -- Poema
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Poema', 'both', 171, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Poema', 'both', 171, null)
    on conflict do nothing;
  -- Rimas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Rimas', 'both', 172, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Rimas', 'both', 172, null)
    on conflict do nothing;
  -- Trabalenguas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Trabalenguas', 'both', 173, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Trabalenguas', 'both', 173, null)
    on conflict do nothing;
  -- Adivinanzas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Adivinanzas', 'both', 174, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Adivinanzas', 'both', 174, null)
    on conflict do nothing;
  -- Refranes y dichos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Refranes y dichos', 'both', 175, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Refranes y dichos', 'both', 175, null)
    on conflict do nothing;
  -- Cuento
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cuento', 'both', 176, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cuento', 'both', 176, null)
    on conflict do nothing;
  -- Fábula
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Fábula', 'both', 177, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Fábula', 'both', 177, null)
    on conflict do nothing;
  -- Leyeneda
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Leyeneda', 'both', 178, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Leyeneda', 'both', 178, null)
    on conflict do nothing;
  -- Narración
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Narración', 'both', 179, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Narración', 'both', 179, null)
    on conflict do nothing;
  -- Biografía
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Biografía', 'both', 180, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Biografía', 'both', 180, null)
    on conflict do nothing;
  -- Carta
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Carta', 'both', 181, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Carta', 'both', 181, null)
    on conflict do nothing;
  -- Receta
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Receta', 'both', 182, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Receta', 'both', 182, null)
    on conflict do nothing;
  -- Instructivo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Instructivo', 'both', 183, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Instructivo', 'both', 183, null)
    on conflict do nothing;
  -- Recado
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Recado', 'both', 184, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Recado', 'both', 184, null)
    on conflict do nothing;
  -- Historieta
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Historieta', 'both', 185, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Historieta', 'both', 185, null)
    on conflict do nothing;
  -- Descripción
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Descripción', 'both', 186, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Descripción', 'both', 186, null)
    on conflict do nothing;
  -- Reseña
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Reseña', 'both', 187, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Reseña', 'both', 187, null)
    on conflict do nothing;
  -- Resumen
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Resumen', 'both', 188, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Resumen', 'both', 188, null)
    on conflict do nothing;
end $block$;

-- === Historia ===
do $block$
declare
  v_plane_i uuid;
  v_plane_ii uuid;
  v_area_i uuid;
  v_area_ii uuid;
  v_cat_i uuid;
  v_cat_ii uuid;
begin
  select id into v_plane_i from development_planes where slug = 'taller-i';
  select id into v_plane_ii from development_planes where slug = 'taller-ii';

  insert into curriculum_areas (plane_id, name, color, sort_order)
    values (v_plane_i, 'Historia', '#f59e0b', 2)
    on conflict do nothing
    returning id into v_area_i;
  if v_area_i is null then
    select id into v_area_i from curriculum_areas where plane_id = v_plane_i and name = 'Historia';
  end if;

  insert into curriculum_areas (plane_id, name, color, sort_order)
    values (v_plane_ii, 'Historia', '#f59e0b', 2)
    on conflict do nothing
    returning id into v_area_ii;
  if v_area_ii is null then
    select id into v_area_ii from curriculum_areas where plane_id = v_plane_ii and name = 'Historia';
  end if;

  insert into curriculum_categories (area_id, name, sort_order)
    values (v_area_i, 'Historia', 0)
    on conflict do nothing
    returning id into v_cat_i;
  if v_cat_i is null then
    select id into v_cat_i from curriculum_categories where area_id = v_area_i and name = 'Historia';
  end if;

  insert into curriculum_categories (area_id, name, sort_order)
    values (v_area_ii, 'Historia', 0)
    on conflict do nothing
    returning id into v_cat_ii;
  if v_cat_ii is null then
    select id into v_cat_ii from curriculum_categories where area_id = v_area_ii and name = 'Historia';
  end if;

  -- Historia de la llegada de la vida
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Historia de la llegada de la vida', 'taller_i', 0, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Historia de la llegada de la vida', 'taller_i', 0, null)
    on conflict do nothing;
  -- La línea negra
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'La línea negra', 'taller_i', 1, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'La línea negra', 'taller_i', 1, null)
    on conflict do nothing;
  -- Ejercicios siguientes
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Ejercicios siguientes', 'both', 2, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Ejercicios siguientes', 'both', 2, null)
    on conflict do nothing;
  -- Línea vida
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Línea vida', 'taller_i', 3, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Línea vida', 'taller_i', 3, null)
    on conflict do nothing;
  -- Historia de la llegada del hombre
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Historia de la llegada del hombre', 'taller_i', 4, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Historia de la llegada del hombre', 'taller_i', 4, null)
    on conflict do nothing;
  -- Ejercicios siguientes
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Ejercicios siguientes', 'both', 5, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Ejercicios siguientes', 'both', 5, null)
    on conflict do nothing;
  -- Notas sobre la historia
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Notas sobre la historia', 'both', 6, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Notas sobre la historia', 'both', 6, null)
    on conflict do nothing;
  -- Línea de la mano
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Línea de la mano', 'taller_i', 7, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Línea de la mano', 'taller_i', 7, null)
    on conflict do nothing;
  -- Historia de la línea de la mano
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Historia de la línea de la mano', 'taller_i', 8, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Historia de la línea de la mano', 'taller_i', 8, null)
    on conflict do nothing;
  -- Notas sobre la línea de la mano
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Notas sobre la línea de la mano', 'taller_i', 9, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Notas sobre la línea de la mano', 'taller_i', 9, null)
    on conflict do nothing;
  -- Reloj de las eras
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Reloj de las eras', 'taller_i', 10, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Reloj de las eras', 'taller_i', 10, null)
    on conflict do nothing;
  -- Historia del reloj de las eras
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Historia del reloj de las eras', 'taller_i', 11, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Historia del reloj de las eras', 'taller_i', 11, null)
    on conflict do nothing;
  -- Primera línea del hombre
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Primera línea del hombre', 'taller_i', 12, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Primera línea del hombre', 'taller_i', 12, null)
    on conflict do nothing;
  -- Presentación de la línea
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Presentación de la línea', 'both', 13, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Presentación de la línea', 'both', 13, null)
    on conflict do nothing;
  -- Necesidades fundamentales
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Necesidades fundamentales', 'taller_i', 14, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Necesidades fundamentales', 'taller_i', 14, null)
    on conflict do nothing;
  -- Comida
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Comida', 'both', 15, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Comida', 'both', 15, null)
    on conflict do nothing;
  -- Dos tipos de gente en movimiento
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Dos tipos de gente en movimiento', 'both', 16, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Dos tipos de gente en movimiento', 'both', 16, null)
    on conflict do nothing;
  -- Cartelones de preguntas de historia
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cartelones de preguntas de historia', 'both', 17, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cartelones de preguntas de historia', 'both', 17, null)
    on conflict do nothing;
  -- Cartelones de migración
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cartelones de migración', 'taller_i', 18, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cartelones de migración', 'taller_i', 18, null)
    on conflict do nothing;
  -- Bolos de villar
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Bolos de villar', 'both', 19, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Bolos de villar', 'both', 19, null)
    on conflict do nothing;
  -- Hordas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Hordas', 'taller_i', 20, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Hordas', 'taller_i', 20, null)
    on conflict do nothing;
  -- Rompiendo la pared
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Rompiendo la pared', 'both', 21, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Rompiendo la pared', 'both', 21, null)
    on conflict do nothing;
  -- Migración por el mar
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Migración por el mar', 'taller_i', 22, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Migración por el mar', 'taller_i', 22, null)
    on conflict do nothing;
  -- Limpiando el bosque
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Limpiando el bosque', 'both', 23, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Limpiando el bosque', 'both', 23, null)
    on conflict do nothing;
  -- Tres fases en la historia
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tres fases en la historia', 'both', 24, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tres fases en la historia', 'both', 24, null)
    on conflict do nothing;
  -- Territorio espiritual
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Territorio espiritual', 'both', 25, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Territorio espiritual', 'both', 25, null)
    on conflict do nothing;
  -- Recolectores de comida
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Recolectores de comida', 'both', 26, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Recolectores de comida', 'both', 26, null)
    on conflict do nothing;
  -- Resolución urbana
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Resolución urbana', 'both', 27, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Resolución urbana', 'both', 27, null)
    on conflict do nothing;
  -- Dos estadios de la Revolución urbana
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Dos estadios de la Revolución urbana', 'taller_i', 28, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Dos estadios de la Revolución urbana', 'taller_i', 28, null)
    on conflict do nothing;
  -- Revolución Industial
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Revolución Industial', 'both', 29, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Revolución Industial', 'both', 29, null)
    on conflict do nothing;
  -- Segunda línea del hombre
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Segunda línea del hombre', 'taller_ii', 30, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Segunda línea del hombre', 'taller_ii', 30, null)
    on conflict do nothing;
  -- Civilizaciones antiguas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Civilizaciones antiguas', 'taller_ii', 31, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Civilizaciones antiguas', 'taller_ii', 31, null)
    on conflict do nothing;
  -- Griegos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Griegos', 'both', 32, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Griegos', 'both', 32, null)
    on conflict do nothing;
  -- Romanos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Romanos', 'both', 33, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Romanos', 'both', 33, null)
    on conflict do nothing;
  -- Mesopotámicos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Mesopotámicos', 'both', 34, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Mesopotámicos', 'both', 34, null)
    on conflict do nothing;
  -- Sumerios
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Sumerios', 'both', 35, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Sumerios', 'both', 35, null)
    on conflict do nothing;
  -- Egipcios
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Egipcios', 'both', 36, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Egipcios', 'both', 36, null)
    on conflict do nothing;
  -- Hindúes
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Hindúes', 'both', 37, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Hindúes', 'both', 37, null)
    on conflict do nothing;
  -- Chinos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Chinos', 'both', 38, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Chinos', 'both', 38, null)
    on conflict do nothing;
  -- Civilizaciones del Nuevo Mundo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Civilizaciones del Nuevo Mundo', 'taller_ii', 39, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Civilizaciones del Nuevo Mundo', 'taller_ii', 39, null)
    on conflict do nothing;
  -- Olmecas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Olmecas', 'both', 40, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Olmecas', 'both', 40, null)
    on conflict do nothing;
  -- Incas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Incas', 'both', 41, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Incas', 'both', 41, null)
    on conflict do nothing;
  -- Aztecas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Aztecas', 'both', 42, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Aztecas', 'both', 42, null)
    on conflict do nothing;
  -- Mayas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Mayas', 'both', 43, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Mayas', 'both', 43, null)
    on conflict do nothing;
  -- Zapotecas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Zapotecas', 'both', 44, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Zapotecas', 'both', 44, null)
    on conflict do nothing;
  -- Mixtecas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Mixtecas', 'both', 45, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Mixtecas', 'both', 45, null)
    on conflict do nothing;
  -- Tarascos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tarascos', 'both', 46, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tarascos', 'both', 46, null)
    on conflict do nothing;
  -- Tarahumaras
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tarahumaras', 'both', 47, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tarahumaras', 'both', 47, null)
    on conflict do nothing;
  -- Diferencias entre culturas antiguas y del NM
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Diferencias entre culturas antiguas y del NM', 'both', 48, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Diferencias entre culturas antiguas y del NM', 'both', 48, null)
    on conflict do nothing;
  -- Tiempo, calendario y escalas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tiempo, calendario y escalas', 'both', 49, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tiempo, calendario y escalas', 'both', 49, null)
    on conflict do nothing;
  -- Trabajo con el tiempo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Trabajo con el tiempo', 'both', 50, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Trabajo con el tiempo', 'both', 50, null)
    on conflict do nothing;
  -- El reloj 0:00
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'El reloj 0:00', 'both', 51, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'El reloj 0:00', 'both', 51, null)
    on conflict do nothing;
  -- El reloj 0:30
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'El reloj 0:30', 'both', 52, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'El reloj 0:30', 'both', 52, null)
    on conflict do nothing;
  -- El reloj 0:15
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'El reloj 0:15', 'both', 53, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'El reloj 0:15', 'both', 53, null)
    on conflict do nothing;
  -- El reloj 0:45
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'El reloj 0:45', 'both', 54, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'El reloj 0:45', 'both', 54, null)
    on conflict do nothing;
  -- Línea del tiempo personal
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Línea del tiempo personal', 'both', 55, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Línea del tiempo personal', 'both', 55, null)
    on conflict do nothing;
  -- Línea del tiempo de la familia
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Línea del tiempo de la familia', 'both', 56, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Línea del tiempo de la familia', 'both', 56, null)
    on conflict do nothing;
  -- Línea: antes y despúes de Cristo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Línea: antes y despúes de Cristo', 'both', 57, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Línea: antes y despúes de Cristo', 'both', 57, null)
    on conflict do nothing;
  -- Otros calendarios
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Otros calendarios', 'both', 58, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Otros calendarios', 'both', 58, null)
    on conflict do nothing;
  -- Grupos de meses y años
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Grupos de meses y años', 'both', 59, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Grupos de meses y años', 'both', 59, null)
    on conflict do nothing;
  -- Líneas del tiempo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Líneas del tiempo', 'both', 60, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Líneas del tiempo', 'both', 60, null)
    on conflict do nothing;
  -- Primera línea del tiempo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Primera línea del tiempo', 'both', 61, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Primera línea del tiempo', 'both', 61, null)
    on conflict do nothing;
  -- Segunda línea del tiempo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Segunda línea del tiempo', 'both', 62, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Segunda línea del tiempo', 'both', 62, null)
    on conflict do nothing;
  -- Línea de la historia de México
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Línea de la historia de México', 'both', 63, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Línea de la historia de México', 'both', 63, null)
    on conflict do nothing;
  -- México prehipánico
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'México prehipánico', 'both', 64, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'México prehipánico', 'both', 64, null)
    on conflict do nothing;
  -- Descubrimiento de América
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Descubrimiento de América', 'both', 65, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Descubrimiento de América', 'both', 65, null)
    on conflict do nothing;
  -- La Conquista
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'La Conquista', 'both', 66, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'La Conquista', 'both', 66, null)
    on conflict do nothing;
  -- Colonia
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Colonia', 'both', 67, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Colonia', 'both', 67, null)
    on conflict do nothing;
  -- México Independiente
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'México Independiente', 'both', 68, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'México Independiente', 'both', 68, null)
    on conflict do nothing;
  -- Reforma
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Reforma', 'both', 69, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Reforma', 'both', 69, null)
    on conflict do nothing;
  -- Porfiriato
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Porfiriato', 'both', 70, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Porfiriato', 'both', 70, null)
    on conflict do nothing;
  -- Revolución Mexicana
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Revolución Mexicana', 'both', 71, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Revolución Mexicana', 'both', 71, null)
    on conflict do nothing;
  -- México Postrevolucionario
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'México Postrevolucionario', 'both', 72, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'México Postrevolucionario', 'both', 72, null)
    on conflict do nothing;
  -- México Moderno
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'México Moderno', 'both', 73, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'México Moderno', 'both', 73, null)
    on conflict do nothing;
end $block$;

-- === Matemáticas ===
do $block$
declare
  v_plane_i uuid;
  v_plane_ii uuid;
  v_area_i uuid;
  v_area_ii uuid;
  v_cat_i uuid;
  v_cat_ii uuid;
begin
  select id into v_plane_i from development_planes where slug = 'taller-i';
  select id into v_plane_ii from development_planes where slug = 'taller-ii';

  insert into curriculum_areas (plane_id, name, color, sort_order)
    values (v_plane_i, 'Matemáticas', '#10b981', 3)
    on conflict do nothing
    returning id into v_area_i;
  if v_area_i is null then
    select id into v_area_i from curriculum_areas where plane_id = v_plane_i and name = 'Matemáticas';
  end if;

  insert into curriculum_areas (plane_id, name, color, sort_order)
    values (v_plane_ii, 'Matemáticas', '#10b981', 3)
    on conflict do nothing
    returning id into v_area_ii;
  if v_area_ii is null then
    select id into v_area_ii from curriculum_areas where plane_id = v_plane_ii and name = 'Matemáticas';
  end if;

  insert into curriculum_categories (area_id, name, sort_order)
    values (v_area_i, 'Matemáticas', 0)
    on conflict do nothing
    returning id into v_cat_i;
  if v_cat_i is null then
    select id into v_cat_i from curriculum_categories where area_id = v_area_i and name = 'Matemáticas';
  end if;

  insert into curriculum_categories (area_id, name, sort_order)
    values (v_area_ii, 'Matemáticas', 0)
    on conflict do nothing
    returning id into v_cat_ii;
  if v_cat_ii is null then
    select id into v_cat_ii from curriculum_categories where area_id = v_area_ii and name = 'Matemáticas';
  end if;

  -- Introducción a matemáticas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción a matemáticas', 'both', 0, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción a matemáticas', 'both', 0, null)
    on conflict do nothing;
  -- Historia de los números
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Historia de los números', 'taller_i', 1, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Historia de los números', 'taller_i', 1, null)
    on conflict do nothing;
  -- Material de las Jerarquías
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Material de las Jerarquías', 'taller_i', 2, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Material de las Jerarquías', 'taller_i', 2, null)
    on conflict do nothing;
  -- 1ra presentación (Cantidad)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, '1ra presentación (Cantidad)', 'both', 3, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, '1ra presentación (Cantidad)', 'both', 3, null)
    on conflict do nothing;
  -- 2da presentación (Comparación de piezas)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, '2da presentación (Comparación de piezas)', 'both', 4, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, '2da presentación (Comparación de piezas)', 'both', 4, null)
    on conflict do nothing;
  -- 3ra presentación (Símbolo y cantidad)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, '3ra presentación (Símbolo y cantidad)', 'both', 5, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, '3ra presentación (Símbolo y cantidad)', 'both', 5, null)
    on conflict do nothing;
  -- Ábaco grande
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Ábaco grande', 'taller_i', 6, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Ábaco grande', 'taller_i', 6, null)
    on conflict do nothing;
  -- Introducción
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción', 'both', 7, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción', 'both', 7, null)
    on conflict do nothing;
  -- Escritura s/ceros
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Escritura s/ceros', 'both', 8, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Escritura s/ceros', 'both', 8, null)
    on conflict do nothing;
  -- Juego de recolección (resultado total)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Juego de recolección (resultado total)', 'both', 9, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Juego de recolección (resultado total)', 'both', 9, null)
    on conflict do nothing;
  -- Formación de cantidades en ábaco y papel
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Formación de cantidades en ábaco y papel', 'both', 10, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Formación de cantidades en ábaco y papel', 'both', 10, null)
    on conflict do nothing;
  -- Multiplicación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Multiplicación', 'both', 11, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Multiplicación', 'both', 11, null)
    on conflict do nothing;
  -- Multiplicación resultados parciales
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Multiplicación resultados parciales', 'both', 12, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Multiplicación resultados parciales', 'both', 12, null)
    on conflict do nothing;
  -- Escritura c/ceros
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Escritura c/ceros', 'both', 13, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Escritura c/ceros', 'both', 13, null)
    on conflict do nothing;
  -- Juego del banco
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Juego del banco', 'taller_i', 14, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Juego del banco', 'taller_i', 14, null)
    on conflict do nothing;
  -- Tarjetas antes del producto final
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tarjetas antes del producto final', 'both', 15, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tarjetas antes del producto final', 'both', 15, null)
    on conflict do nothing;
  -- Cambios en cada categoría
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cambios en cada categoría', 'both', 16, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cambios en cada categoría', 'both', 16, null)
    on conflict do nothing;
  -- Cambio de tarjetas en cada momento
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cambio de tarjetas en cada momento', 'both', 17, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cambio de tarjetas en cada momento', 'both', 17, null)
    on conflict do nothing;
  -- Ábaco dorado
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Ábaco dorado', 'taller_i', 18, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Ábaco dorado', 'taller_i', 18, null)
    on conflict do nothing;
  -- Producto final
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Producto final', 'both', 19, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Producto final', 'both', 19, null)
    on conflict do nothing;
  -- Productos parciales
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Productos parciales', 'both', 20, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Productos parciales', 'both', 20, null)
    on conflict do nothing;
  -- Abstracción
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Abstracción', 'both', 21, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Abstracción', 'both', 21, null)
    on conflict do nothing;
  -- Ajedrez
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Ajedrez', 'both', 22, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Ajedrez', 'both', 22, null)
    on conflict do nothing;
  -- Introducción al ajedrez
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción al ajedrez', 'both', 23, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción al ajedrez', 'both', 23, null)
    on conflict do nothing;
  -- Barras de colores
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Barras de colores', 'taller_i', 24, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Barras de colores', 'taller_i', 24, null)
    on conflict do nothing;
  -- Multiplicación utilizando las tablas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Multiplicación utilizando las tablas', 'both', 25, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Multiplicación utilizando las tablas', 'both', 25, null)
    on conflict do nothing;
  -- Multiplicación por categorías
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Multiplicación por categorías', 'both', 26, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Multiplicación por categorías', 'both', 26, null)
    on conflict do nothing;
  -- Colocando cuentas en cada categoría
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Colocando cuentas en cada categoría', 'both', 27, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Colocando cuentas en cada categoría', 'both', 27, null)
    on conflict do nothing;
  -- Uso de cuentas para cambios mentales
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Uso de cuentas para cambios mentales', 'both', 28, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Uso de cuentas para cambios mentales', 'both', 28, null)
    on conflict do nothing;
  -- Paso a la abstracción
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Paso a la abstracción', 'both', 29, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Paso a la abstracción', 'both', 29, null)
    on conflict do nothing;
  -- Multiplicación geométrica
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Multiplicación geométrica', 'taller_i', 30, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Multiplicación geométrica', 'taller_i', 30, null)
    on conflict do nothing;
  -- Presentación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Presentación', 'both', 31, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Presentación', 'both', 31, null)
    on conflict do nothing;
  -- Variación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Variación', 'both', 32, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Variación', 'both', 32, null)
    on conflict do nothing;
  -- Propiedad conmutativa y distributiva
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Propiedad conmutativa y distributiva', 'taller_i', 33, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Propiedad conmutativa y distributiva', 'taller_i', 33, null)
    on conflict do nothing;
  -- Introducción: un dígito por un dígito
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción: un dígito por un dígito', 'both', 34, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción: un dígito por un dígito', 'both', 34, null)
    on conflict do nothing;
  -- Propiedad distributiva: suma por un digíto
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Propiedad distributiva: suma por un digíto', 'both', 35, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Propiedad distributiva: suma por un digíto', 'both', 35, null)
    on conflict do nothing;
  -- Suma por suma
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Suma por suma', 'both', 36, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Suma por suma', 'both', 36, null)
    on conflict do nothing;
  -- Pasos hacia la abstracción
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Pasos hacia la abstracción', 'both', 37, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Pasos hacia la abstracción', 'both', 37, null)
    on conflict do nothing;
  -- Propiedad distributiva: sistema decimal
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Propiedad distributiva: sistema decimal', 'both', 38, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Propiedad distributiva: sistema decimal', 'both', 38, null)
    on conflict do nothing;
  -- Múltiplos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Múltiplos', 'taller_ii', 39, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Múltiplos', 'taller_ii', 39, null)
    on conflict do nothing;
  -- Concepto
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Concepto', 'both', 40, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Concepto', 'both', 40, null)
    on conflict do nothing;
  -- Introducción a múltiplo común (barras col.)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción a múltiplo común (barras col.)', 'both', 41, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción a múltiplo común (barras col.)', 'both', 41, null)
    on conflict do nothing;
  -- Múltiplos de diferentes maneras
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Múltiplos de diferentes maneras', 'taller_ii', 42, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Múltiplos de diferentes maneras', 'taller_ii', 42, null)
    on conflict do nothing;
  -- Tablas de múltiplos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tablas de múltiplos', 'taller_ii', 43, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tablas de múltiplos', 'taller_ii', 43, null)
    on conflict do nothing;
  -- Introducción a Mínimo Común Múltiplo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción a Mínimo Común Múltiplo', 'taller_ii', 44, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción a Mínimo Común Múltiplo', 'taller_ii', 44, null)
    on conflict do nothing;
  -- Factores
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Factores', 'taller_ii', 45, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Factores', 'taller_ii', 45, null)
    on conflict do nothing;
  -- Concepto
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Concepto', 'both', 46, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Concepto', 'both', 46, null)
    on conflict do nothing;
  -- Factores primos en tabla C
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Factores primos en tabla C', 'taller_ii', 47, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Factores primos en tabla C', 'taller_ii', 47, null)
    on conflict do nothing;
  -- Factores primos (con pijas)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Factores primos (con pijas)', 'taller_ii', 48, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Factores primos (con pijas)', 'taller_ii', 48, null)
    on conflict do nothing;
  -- Máximo Común Divisor (con pijas)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Máximo Común Divisor (con pijas)', 'taller_ii', 49, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Máximo Común Divisor (con pijas)', 'taller_ii', 49, null)
    on conflict do nothing;
  -- Factores comunes en tabla C
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Factores comunes en tabla C', 'taller_ii', 50, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Factores comunes en tabla C', 'taller_ii', 50, null)
    on conflict do nothing;
  -- Pasos hacia la abstracción
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Pasos hacia la abstracción', 'both', 51, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Pasos hacia la abstracción', 'both', 51, null)
    on conflict do nothing;
  -- División
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'División', 'both', 52, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'División', 'both', 52, null)
    on conflict do nothing;
  -- Gran división
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Gran división', 'both', 53, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Gran división', 'both', 53, null)
    on conflict do nothing;
  -- Escribiendo el cociente
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Escribiendo el cociente', 'both', 54, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Escribiendo el cociente', 'both', 54, null)
    on conflict do nothing;
  -- Escribiendo el cociente y los residuos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Escribiendo el cociente y los residuos', 'both', 55, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Escribiendo el cociente y los residuos', 'both', 55, null)
    on conflict do nothing;
  -- Calculando y anotando la cantidad utilizada
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Calculando y anotando la cantidad utilizada', 'both', 56, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Calculando y anotando la cantidad utilizada', 'both', 56, null)
    on conflict do nothing;
  -- División agrupada
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'División agrupada', 'both', 57, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'División agrupada', 'both', 57, null)
    on conflict do nothing;
  -- Un dígito en el divisor
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Un dígito en el divisor', 'both', 58, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Un dígito en el divisor', 'both', 58, null)
    on conflict do nothing;
  -- Varios digítos en el divisor
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Varios digítos en el divisor', 'both', 59, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Varios digítos en el divisor', 'both', 59, null)
    on conflict do nothing;
  -- División de grupo en papel
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'División de grupo en papel', 'both', 60, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'División de grupo en papel', 'both', 60, null)
    on conflict do nothing;
  -- Fracciones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Fracciones', 'both', 61, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Fracciones', 'both', 61, null)
    on conflict do nothing;
  -- Divisibilidad
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Divisibilidad', 'both', 62, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Divisibilidad', 'both', 62, null)
    on conflict do nothing;
  -- Grupo uno: 2/ 5/ 25
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Grupo uno: 2/ 5/ 25', 'both', 63, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Grupo uno: 2/ 5/ 25', 'both', 63, null)
    on conflict do nothing;
  -- Grupo dos: 4 / 8
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Grupo dos: 4 / 8', 'both', 64, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Grupo dos: 4 / 8', 'both', 64, null)
    on conflict do nothing;
  -- Grupo tres: 3 / 9 / factores primos/ 6 /7 / 11
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Grupo tres: 3 / 9 / factores primos/ 6 /7 / 11', 'taller_ii', 65, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Grupo tres: 3 / 9 / factores primos/ 6 /7 / 11', 'taller_ii', 65, null)
    on conflict do nothing;
  -- Cuadrados y cubos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cuadrados y cubos', 'taller_i', 66, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cuadrados y cubos', 'taller_i', 66, null)
    on conflict do nothing;
  -- Introducción a cuadrados y cubos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción a cuadrados y cubos', 'taller_i', 67, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción a cuadrados y cubos', 'taller_i', 67, null)
    on conflict do nothing;
  -- Notación de cuadrados y cubos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Notación de cuadrados y cubos', 'taller_i', 68, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Notación de cuadrados y cubos', 'taller_i', 68, null)
    on conflict do nothing;
  -- Juegos con cuadrados y cubos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Juegos con cuadrados y cubos', 'taller_i', 69, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Juegos con cuadrados y cubos', 'taller_i', 69, null)
    on conflict do nothing;
  -- Calculando el total de los cuadrados
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Calculando el total de los cuadrados', 'both', 70, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Calculando el total de los cuadrados', 'both', 70, null)
    on conflict do nothing;
  -- Cuadrados en tablas de multiplicar
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cuadrados en tablas de multiplicar', 'both', 71, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cuadrados en tablas de multiplicar', 'both', 71, null)
    on conflict do nothing;
  -- Escribir cuadrados y cubos (diferencias)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Escribir cuadrados y cubos (diferencias)', 'taller_i', 72, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Escribir cuadrados y cubos (diferencias)', 'taller_i', 72, null)
    on conflict do nothing;
  -- Decanomio
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Decanomio', 'taller_i', 73, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Decanomio', 'taller_i', 73, null)
    on conflict do nothing;
  -- Encontrando los cuadrados en la diagonal
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Encontrando los cuadrados en la diagonal', 'both', 74, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Encontrando los cuadrados en la diagonal', 'both', 74, null)
    on conflict do nothing;
  -- Cambios utilizando propiedad conmutativa
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cambios utilizando propiedad conmutativa', 'taller_i', 75, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cambios utilizando propiedad conmutativa', 'taller_i', 75, null)
    on conflict do nothing;
  -- Cambiando a cuadrados
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cambiando a cuadrados', 'both', 76, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cambiando a cuadrados', 'both', 76, null)
    on conflict do nothing;
  -- Cambiando los cuadrados a cubos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cambiando los cuadrados a cubos', 'both', 77, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cambiando los cuadrados a cubos', 'both', 77, null)
    on conflict do nothing;
  -- Construyendo la torre
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Construyendo la torre', 'both', 78, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Construyendo la torre', 'both', 78, null)
    on conflict do nothing;
  -- Extensiones del decanomio
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Extensiones del decanomio', 'taller_i', 79, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Extensiones del decanomio', 'taller_i', 79, null)
    on conflict do nothing;
  -- Reproducción en papel
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Reproducción en papel', 'both', 80, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Reproducción en papel', 'both', 80, null)
    on conflict do nothing;
  -- Decanomio algebraico
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Decanomio algebraico', 'taller_i', 81, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Decanomio algebraico', 'taller_i', 81, null)
    on conflict do nothing;
  -- Decanomio numérico
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Decanomio numérico', 'taller_i', 82, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Decanomio numérico', 'taller_i', 82, null)
    on conflict do nothing;
  -- Las cuatro operaciones fundamentales
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Las cuatro operaciones fundamentales', 'both', 83, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Las cuatro operaciones fundamentales', 'both', 83, null)
    on conflict do nothing;
  -- Transformación de cuadrados
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Transformación de cuadrados', 'both', 84, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Transformación de cuadrados', 'both', 84, null)
    on conflict do nothing;
  -- Transformación del cuadrado del diez al bin.
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Transformación del cuadrado del diez al bin.', 'both', 85, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Transformación del cuadrado del diez al bin.', 'both', 85, null)
    on conflict do nothing;
  -- Transformación del cuadrado del diez al trin.
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Transformación del cuadrado del diez al trin.', 'both', 86, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Transformación del cuadrado del diez al trin.', 'both', 86, null)
    on conflict do nothing;
  -- Cuadrados en papel punteado
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cuadrados en papel punteado', 'both', 87, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cuadrados en papel punteado', 'both', 87, null)
    on conflict do nothing;
  -- Cuadrados en papel cuadriculado
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cuadrados en papel cuadriculado', 'both', 88, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cuadrados en papel cuadriculado', 'both', 88, null)
    on conflict do nothing;
  -- Expresión algebraica (binomio)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Expresión algebraica (binomio)', 'both', 89, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Expresión algebraica (binomio)', 'both', 89, null)
    on conflict do nothing;
  -- Expresión algebraica (trinomio)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Expresión algebraica (trinomio)', 'both', 90, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Expresión algebraica (trinomio)', 'both', 90, null)
    on conflict do nothing;
  -- Paso de un cuadrado a otro
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Paso de un cuadrado a otro', 'both', 91, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Paso de un cuadrado a otro', 'both', 91, null)
    on conflict do nothing;
  -- De un cuadrado a otro sucesivo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'De un cuadrado a otro sucesivo', 'both', 92, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'De un cuadrado a otro sucesivo', 'both', 92, null)
    on conflict do nothing;
  -- De un cuadrado a otro sucesivo (cuadrados)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'De un cuadrado a otro sucesivo (cuadrados)', 'both', 93, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'De un cuadrado a otro sucesivo (cuadrados)', 'both', 93, null)
    on conflict do nothing;
  -- De un cuadrado a otro no sucesivo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'De un cuadrado a otro no sucesivo', 'both', 94, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'De un cuadrado a otro no sucesivo', 'both', 94, null)
    on conflict do nothing;
  -- Suma al cuadrado (binomio)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Suma al cuadrado (binomio)', 'both', 95, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Suma al cuadrado (binomio)', 'both', 95, null)
    on conflict do nothing;
  -- Suma al cuadrado (trinomio)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Suma al cuadrado (trinomio)', 'both', 96, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Suma al cuadrado (trinomio)', 'both', 96, null)
    on conflict do nothing;
  -- Expresión algebraica
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Expresión algebraica', 'both', 97, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Expresión algebraica', 'both', 97, null)
    on conflict do nothing;
  -- Cuadrados con valor jerárquico
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cuadrados con valor jerárquico', 'both', 98, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cuadrados con valor jerárquico', 'both', 98, null)
    on conflict do nothing;
  -- Valor decimal
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Valor decimal', 'both', 99, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Valor decimal', 'both', 99, null)
    on conflict do nothing;
  -- Binomio al cuadrado (con pijas)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Binomio al cuadrado (con pijas)', 'both', 100, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Binomio al cuadrado (con pijas)', 'both', 100, null)
    on conflict do nothing;
  -- Trinomio al cuadrado (con pijas)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Trinomio al cuadrado (con pijas)', 'both', 101, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Trinomio al cuadrado (con pijas)', 'both', 101, null)
    on conflict do nothing;
  -- Construyendo el trinomio
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Construyendo el trinomio', 'both', 102, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Construyendo el trinomio', 'both', 102, null)
    on conflict do nothing;
  -- Extracción de las reglas de los cuadrados
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Extracción de las reglas de los cuadrados', 'both', 103, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Extracción de las reglas de los cuadrados', 'both', 103, null)
    on conflict do nothing;
  -- Fórmula del trinomio
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Fórmula del trinomio', 'both', 104, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Fórmula del trinomio', 'both', 104, null)
    on conflict do nothing;
  -- Binomio al cubo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Binomio al cubo', 'both', 105, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Binomio al cubo', 'both', 105, null)
    on conflict do nothing;
  -- Construyendo el cubo del binomio (un piso)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Construyendo el cubo del binomio (un piso)', 'both', 106, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Construyendo el cubo del binomio (un piso)', 'both', 106, null)
    on conflict do nothing;
  -- Iniciando con el cubo del primer término
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Iniciando con el cubo del primer término', 'both', 107, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Iniciando con el cubo del primer término', 'both', 107, null)
    on conflict do nothing;
  -- Expresión algebraica
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Expresión algebraica', 'both', 108, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Expresión algebraica', 'both', 108, null)
    on conflict do nothing;
  -- Tapa del cubo del trinomio expresar formúla
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tapa del cubo del trinomio expresar formúla', 'both', 109, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tapa del cubo del trinomio expresar formúla', 'both', 109, null)
    on conflict do nothing;
  -- Trinomio al cubo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Trinomio al cubo', 'both', 110, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Trinomio al cubo', 'both', 110, null)
    on conflict do nothing;
  -- Cubo del trinomio algebraico
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cubo del trinomio algebraico', 'both', 111, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cubo del trinomio algebraico', 'both', 111, null)
    on conflict do nothing;
  -- Cuatrinomio al cubo algebraico
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cuatrinomio al cubo algebraico', 'both', 112, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cuatrinomio al cubo algebraico', 'both', 112, null)
    on conflict do nothing;
  -- Cubo del trinomio con valor numérico
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cubo del trinomio con valor numérico', 'both', 113, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cubo del trinomio con valor numérico', 'both', 113, null)
    on conflict do nothing;
  -- Historia de los 3 reyes
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Historia de los 3 reyes', 'both', 114, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Historia de los 3 reyes', 'both', 114, null)
    on conflict do nothing;
  -- Cubo del trinomio
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cubo del trinomio', 'both', 115, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cubo del trinomio', 'both', 115, null)
    on conflict do nothing;
  -- Valor jerárquico (notación abc/udc)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Valor jerárquico (notación abc/udc)', 'both', 116, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Valor jerárquico (notación abc/udc)', 'both', 116, null)
    on conflict do nothing;
  -- Valor numérico
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Valor numérico', 'both', 117, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Valor numérico', 'both', 117, null)
    on conflict do nothing;
  -- Utilizando valores decimales
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Utilizando valores decimales', 'both', 118, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Utilizando valores decimales', 'both', 118, null)
    on conflict do nothing;
  -- Raíz cuadrada
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Raíz cuadrada', 'taller_ii', 119, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Raíz cuadrada', 'taller_ii', 119, null)
    on conflict do nothing;
  -- Concepto y notación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Concepto y notación', 'both', 120, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Concepto y notación', 'both', 120, null)
    on conflict do nothing;
  -- Raíz cuadrada (sistema decimal)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Raíz cuadrada (sistema decimal)', 'taller_ii', 121, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Raíz cuadrada (sistema decimal)', 'taller_ii', 121, null)
    on conflict do nothing;
  -- Raíz cuadrada (con pijas)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Raíz cuadrada (con pijas)', 'taller_ii', 122, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Raíz cuadrada (con pijas)', 'taller_ii', 122, null)
    on conflict do nothing;
  -- Escribiendo el resultado final
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Escribiendo el resultado final', 'both', 123, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Escribiendo el resultado final', 'both', 123, null)
    on conflict do nothing;
  -- Escribiendo la cantidad utilizada y residuos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Escribiendo la cantidad utilizada y residuos', 'both', 124, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Escribiendo la cantidad utilizada y residuos', 'both', 124, null)
    on conflict do nothing;
  -- Escribiendo cantidad, residuos y análisis
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Escribiendo cantidad, residuos y análisis', 'both', 125, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Escribiendo cantidad, residuos y análisis', 'both', 125, null)
    on conflict do nothing;
  -- "Un paso hacia atrás"
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, '"Un paso hacia atrás"', 'both', 126, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, '"Un paso hacia atrás"', 'both', 126, null)
    on conflict do nothing;
  -- Paso a la abstracción
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Paso a la abstracción', 'both', 127, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Paso a la abstracción', 'both', 127, null)
    on conflict do nothing;
  -- Completando cuadrados, cantidad y residuos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Completando cuadrados, cantidad y residuos', 'both', 128, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Completando cuadrados, cantidad y residuos', 'both', 128, null)
    on conflict do nothing;
  -- Anticipando la raíz
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Anticipando la raíz', 'taller_i', 129, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Anticipando la raíz', 'taller_i', 129, null)
    on conflict do nothing;
  -- Reglas para calcular lo que se utilizará
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Reglas para calcular lo que se utilizará', 'both', 130, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Reglas para calcular lo que se utilizará', 'both', 130, null)
    on conflict do nothing;
  -- Casos especiales
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Casos especiales', 'both', 131, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Casos especiales', 'both', 131, null)
    on conflict do nothing;
  -- Cero en las decenas de la raíz
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cero en las decenas de la raíz', 'taller_i', 132, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cero en las decenas de la raíz', 'taller_i', 132, null)
    on conflict do nothing;
  -- Cero en las unidades de la raíz
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cero en las unidades de la raíz', 'taller_i', 133, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cero en las unidades de la raíz', 'taller_i', 133, null)
    on conflict do nothing;
  -- Fórumla
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Fórumla', 'both', 134, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Fórumla', 'both', 134, null)
    on conflict do nothing;
  -- Raíz cúbica
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Raíz cúbica', 'taller_ii', 135, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Raíz cúbica', 'taller_ii', 135, null)
    on conflict do nothing;
  -- Presentación del concepto y su notación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Presentación del concepto y su notación', 'both', 136, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Presentación del concepto y su notación', 'both', 136, null)
    on conflict do nothing;
  -- Dos dígitos en la raíz (con cubos de madera)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Dos dígitos en la raíz (con cubos de madera)', 'taller_i', 137, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Dos dígitos en la raíz (con cubos de madera)', 'taller_i', 137, null)
    on conflict do nothing;
  -- Introducción al proceso (con resultado)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción al proceso (con resultado)', 'both', 138, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción al proceso (con resultado)', 'both', 138, null)
    on conflict do nothing;
  -- Calculando el dígito desconocido
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Calculando el dígito desconocido', 'both', 139, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Calculando el dígito desconocido', 'both', 139, null)
    on conflict do nothing;
  -- "Un paso hacia atrás"
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, '"Un paso hacia atrás"', 'both', 140, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, '"Un paso hacia atrás"', 'both', 140, null)
    on conflict do nothing;
  -- Tres dígitos en la raíz con el cubo jerárquico
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tres dígitos en la raíz con el cubo jerárquico', 'taller_i', 141, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tres dígitos en la raíz con el cubo jerárquico', 'taller_i', 141, null)
    on conflict do nothing;
  -- Paso a la abstracción
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Paso a la abstracción', 'both', 142, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Paso a la abstracción', 'both', 142, null)
    on conflict do nothing;
  -- Fórmula
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Fórmula', 'both', 143, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Fórmula', 'both', 143, null)
    on conflict do nothing;
  -- Fracciones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Fracciones', 'both', 144, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Fracciones', 'both', 144, null)
    on conflict do nothing;
  -- Introducción
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción', 'both', 145, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción', 'both', 145, null)
    on conflict do nothing;
  -- Cartelones de fracciones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cartelones de fracciones', 'both', 146, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cartelones de fracciones', 'both', 146, null)
    on conflict do nothing;
  -- Equivalencias
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Equivalencias', 'both', 147, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Equivalencias', 'both', 147, null)
    on conflict do nothing;
  -- Operaciones simples
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Operaciones simples', 'both', 148, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Operaciones simples', 'both', 148, null)
    on conflict do nothing;
  -- Suma y resta con diferente denominador
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Suma y resta con diferente denominador', 'both', 149, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Suma y resta con diferente denominador', 'both', 149, null)
    on conflict do nothing;
  -- Ejercicios de suma en abstracción
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Ejercicios de suma en abstracción', 'both', 150, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Ejercicios de suma en abstracción', 'both', 150, null)
    on conflict do nothing;
  -- Resta de diferente denominador
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Resta de diferente denominador', 'both', 151, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Resta de diferente denominador', 'both', 151, null)
    on conflict do nothing;
  -- Multiplicación de fracciones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Multiplicación de fracciones', 'both', 152, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Multiplicación de fracciones', 'both', 152, null)
    on conflict do nothing;
  -- División
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'División', 'both', 153, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'División', 'both', 153, null)
    on conflict do nothing;
  -- Tipos de fracciones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tipos de fracciones', 'both', 154, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tipos de fracciones', 'both', 154, null)
    on conflict do nothing;
  -- Conversión de impropia a mixta
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Conversión de impropia a mixta', 'both', 155, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Conversión de impropia a mixta', 'both', 155, null)
    on conflict do nothing;
  -- Conversión de mixta a impropia
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Conversión de mixta a impropia', 'both', 156, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Conversión de mixta a impropia', 'both', 156, null)
    on conflict do nothing;
  -- Decimales
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Decimales', 'both', 157, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Decimales', 'both', 157, null)
    on conflict do nothing;
  -- Introducción a decimales
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción a decimales', 'both', 158, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción a decimales', 'both', 158, null)
    on conflict do nothing;
  -- Operaciones simples
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Operaciones simples', 'both', 159, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Operaciones simples', 'both', 159, null)
    on conflict do nothing;
  -- Conversión de fracciones a deciamles
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Conversión de fracciones a deciamles', 'both', 160, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Conversión de fracciones a deciamles', 'both', 160, null)
    on conflict do nothing;
  -- El poder del 10 (multiplicación y división)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'El poder del 10 (multiplicación y división)', 'both', 161, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'El poder del 10 (multiplicación y división)', 'both', 161, null)
    on conflict do nothing;
  -- Multiplicación de decimal por decimal
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Multiplicación de decimal por decimal', 'both', 162, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Multiplicación de decimal por decimal', 'both', 162, null)
    on conflict do nothing;
  -- Tablero ajedrez
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tablero ajedrez', 'both', 163, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tablero ajedrez', 'both', 163, null)
    on conflict do nothing;
  -- Introducción al tablero de ajedrez, decimales
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción al tablero de ajedrez, decimales', 'both', 164, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción al tablero de ajedrez, decimales', 'both', 164, null)
    on conflict do nothing;
  -- Problemas de multilplicación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Problemas de multilplicación', 'both', 165, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Problemas de multilplicación', 'both', 165, null)
    on conflict do nothing;
  -- Problemas de división
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Problemas de división', 'both', 166, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Problemas de división', 'both', 166, null)
    on conflict do nothing;
  -- División de decimal entre decimal
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'División de decimal entre decimal', 'both', 167, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'División de decimal entre decimal', 'both', 167, null)
    on conflict do nothing;
  -- Paso a la abstracción (multip. De deciamles)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Paso a la abstracción (multip. De deciamles)', 'both', 168, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Paso a la abstracción (multip. De deciamles)', 'both', 168, null)
    on conflict do nothing;
  -- División con decimales en papel
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'División con decimales en papel', 'both', 169, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'División con decimales en papel', 'both', 169, null)
    on conflict do nothing;
  -- Potencias
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Potencias', 'taller_ii', 170, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Potencias', 'taller_ii', 170, null)
    on conflict do nothing;
  -- Potencia del dos y ejercicios relacionados
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Potencia del dos y ejercicios relacionados', 'both', 171, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Potencia del dos y ejercicios relacionados', 'both', 171, null)
    on conflict do nothing;
  -- Potencia del dos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Potencia del dos', 'both', 172, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Potencia del dos', 'both', 172, null)
    on conflict do nothing;
  -- Potencia del tres
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Potencia del tres', 'both', 173, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Potencia del tres', 'both', 173, null)
    on conflict do nothing;
  -- Las unidades pueden tener cualquier tamaño
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Las unidades pueden tener cualquier tamaño', 'both', 174, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Las unidades pueden tener cualquier tamaño', 'both', 174, null)
    on conflict do nothing;
  -- Patrón: punto, línea, cuadrado
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Patrón: punto, línea, cuadrado', 'both', 175, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Patrón: punto, línea, cuadrado', 'both', 175, null)
    on conflict do nothing;
  -- Potencia del 10
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Potencia del 10', 'both', 176, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Potencia del 10', 'both', 176, null)
    on conflict do nothing;
  -- Potenciación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Potenciación', 'both', 177, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Potenciación', 'both', 177, null)
    on conflict do nothing;
  -- Operaciones simples
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Operaciones simples', 'both', 178, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Operaciones simples', 'both', 178, null)
    on conflict do nothing;
  -- El poder de las potencias
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'El poder de las potencias', 'taller_ii', 179, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'El poder de las potencias', 'taller_ii', 179, null)
    on conflict do nothing;
  -- Operaciones con potencias
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Operaciones con potencias', 'taller_ii', 180, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Operaciones con potencias', 'taller_ii', 180, null)
    on conflict do nothing;
  -- Introducción al álgebra
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción al álgebra', 'taller_ii', 181, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción al álgebra', 'taller_ii', 181, null)
    on conflict do nothing;
  -- Balanceando una ecuación (+  -  x  /)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Balanceando una ecuación (+  -  x  /)', 'both', 182, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Balanceando una ecuación (+  -  x  /)', 'both', 182, null)
    on conflict do nothing;
  -- Números positivos y negativos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Números positivos y negativos', 'taller_ii', 183, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Números positivos y negativos', 'taller_ii', 183, null)
    on conflict do nothing;
  -- Suma
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Suma', 'both', 184, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Suma', 'both', 184, null)
    on conflict do nothing;
  -- Resta
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Resta', 'both', 185, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Resta', 'both', 185, null)
    on conflict do nothing;
  -- Multiplicación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Multiplicación', 'both', 186, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Multiplicación', 'both', 186, null)
    on conflict do nothing;
  -- División
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'División', 'both', 187, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'División', 'both', 187, null)
    on conflict do nothing;
  -- Problemas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Problemas', 'both', 188, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Problemas', 'both', 188, null)
    on conflict do nothing;
  -- Pasos para resolver problemas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Pasos para resolver problemas', 'both', 189, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Pasos para resolver problemas', 'both', 189, null)
    on conflict do nothing;
  -- Distancia, tiempo y velocidad
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Distancia, tiempo y velocidad', 'both', 190, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Distancia, tiempo y velocidad', 'both', 190, null)
    on conflict do nothing;
  -- Interés, capital, tiempo y porcentaje
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Interés, capital, tiempo y porcentaje', 'both', 191, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Interés, capital, tiempo y porcentaje', 'both', 191, null)
    on conflict do nothing;
  -- Razones y proporciones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Razones y proporciones', 'taller_ii', 192, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Razones y proporciones', 'taller_ii', 192, null)
    on conflict do nothing;
  -- Razón
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Razón', 'both', 193, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Razón', 'both', 193, null)
    on conflict do nothing;
  -- Concepto
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Concepto', 'both', 194, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Concepto', 'both', 194, null)
    on conflict do nothing;
  -- Problemas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Problemas', 'both', 195, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Problemas', 'both', 195, null)
    on conflict do nothing;
  -- Razones como fracciones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Razones como fracciones', 'taller_ii', 196, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Razones como fracciones', 'taller_ii', 196, null)
    on conflict do nothing;
  -- Proporción
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Proporción', 'taller_ii', 197, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Proporción', 'taller_ii', 197, null)
    on conflict do nothing;
  -- Concepto
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Concepto', 'both', 198, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Concepto', 'both', 198, null)
    on conflict do nothing;
  -- Proporción en dos dimensiones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Proporción en dos dimensiones', 'taller_ii', 199, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Proporción en dos dimensiones', 'taller_ii', 199, null)
    on conflict do nothing;
  -- Proporción en tres dimensiones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Proporción en tres dimensiones', 'taller_ii', 200, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Proporción en tres dimensiones', 'taller_ii', 200, null)
    on conflict do nothing;
  -- Diferentes bases numéricas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Diferentes bases numéricas', 'taller_ii', 201, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Diferentes bases numéricas', 'taller_ii', 201, null)
    on conflict do nothing;
  -- Contando en otra base numérica
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Contando en otra base numérica', 'both', 202, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Contando en otra base numérica', 'both', 202, null)
    on conflict do nothing;
  -- Operaciones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Operaciones', 'both', 203, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Operaciones', 'both', 203, null)
    on conflict do nothing;
  -- Conversión de un número en base 10 a otra
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Conversión de un número en base 10 a otra', 'both', 204, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Conversión de un número en base 10 a otra', 'both', 204, null)
    on conflict do nothing;
  -- Medidas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Medidas', 'both', 205, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Medidas', 'both', 205, null)
    on conflict do nothing;
  -- Sistema Métrico Decimal
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Sistema Métrico Decimal', 'both', 206, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Sistema Métrico Decimal', 'both', 206, null)
    on conflict do nothing;
  -- Longitud
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Longitud', 'both', 207, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Longitud', 'both', 207, null)
    on conflict do nothing;
  -- Capacidad, peso
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Capacidad, peso', 'both', 208, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Capacidad, peso', 'both', 208, null)
    on conflict do nothing;
  -- Tablero decimal-múltiplos, submúltiplos, conversiones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tablero decimal-múltiplos, submúltiplos, conversiones', 'taller_ii', 209, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tablero decimal-múltiplos, submúltiplos, conversiones', 'taller_ii', 209, null)
    on conflict do nothing;
  -- Tiempo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tiempo', 'both', 210, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tiempo', 'both', 210, null)
    on conflict do nothing;
  -- Temperatura
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Temperatura', 'both', 211, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Temperatura', 'both', 211, null)
    on conflict do nothing;
  -- Ángulos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Ángulos', 'taller_i', 212, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Ángulos', 'taller_i', 212, null)
    on conflict do nothing;
  -- Dinero
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Dinero', 'both', 213, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Dinero', 'both', 213, null)
    on conflict do nothing;
  -- Matemáticas remediales
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Matemáticas remediales', 'both', 214, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Matemáticas remediales', 'both', 214, null)
    on conflict do nothing;
  -- Otros conceptos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Otros conceptos', 'both', 215, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Otros conceptos', 'both', 215, null)
    on conflict do nothing;
  -- Números enteros ( < > = )
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Números enteros ( < > = )', 'both', 216, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Números enteros ( < > = )', 'both', 216, null)
    on conflict do nothing;
  -- Fracciones ( < > = )
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Fracciones ( < > = )', 'both', 217, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Fracciones ( < > = )', 'both', 217, null)
    on conflict do nothing;
  -- Decimales ( < > = )
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Decimales ( < > = )', 'both', 218, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Decimales ( < > = )', 'both', 218, null)
    on conflict do nothing;
  -- Sucesor y antecesor (enteros, fracciones y decimales)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Sucesor y antecesor (enteros, fracciones y decimales)', 'both', 219, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Sucesor y antecesor (enteros, fracciones y decimales)', 'both', 219, null)
    on conflict do nothing;
  -- Series numéricas con números enteros
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Series numéricas con números enteros', 'both', 220, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Series numéricas con números enteros', 'both', 220, null)
    on conflict do nothing;
  -- Series numéricas con fracciones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Series numéricas con fracciones', 'both', 221, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Series numéricas con fracciones', 'both', 221, null)
    on conflict do nothing;
  -- Series numéricas con decimales
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Series numéricas con decimales', 'both', 222, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Series numéricas con decimales', 'both', 222, null)
    on conflict do nothing;
  -- Manejo del dinero
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Manejo del dinero', 'both', 223, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Manejo del dinero', 'both', 223, null)
    on conflict do nothing;
  -- Problemas con una operación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Problemas con una operación', 'both', 224, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Problemas con una operación', 'both', 224, null)
    on conflict do nothing;
  -- Problemas con 2 o más operaciones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Problemas con 2 o más operaciones', 'both', 225, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Problemas con 2 o más operaciones', 'both', 225, null)
    on conflict do nothing;
  -- Problemas con fracciones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Problemas con fracciones', 'both', 226, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Problemas con fracciones', 'both', 226, null)
    on conflict do nothing;
  -- Problemas con decimales
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Problemas con decimales', 'both', 227, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Problemas con decimales', 'both', 227, null)
    on conflict do nothing;
  -- Problemas con dinero
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Problemas con dinero', 'both', 228, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Problemas con dinero', 'both', 228, null)
    on conflict do nothing;
  -- Problemas de área
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Problemas de área', 'both', 229, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Problemas de área', 'both', 229, null)
    on conflict do nothing;
  -- Problemas de volumen
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Problemas de volumen', 'both', 230, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Problemas de volumen', 'both', 230, null)
    on conflict do nothing;
  -- Redondeo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Redondeo', 'both', 231, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Redondeo', 'both', 231, null)
    on conflict do nothing;
  -- Recta numérica enteros
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Recta numérica enteros', 'both', 232, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Recta numérica enteros', 'both', 232, null)
    on conflict do nothing;
  -- Recta numérica fracciones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Recta numérica fracciones', 'both', 233, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Recta numérica fracciones', 'both', 233, null)
    on conflict do nothing;
  -- Recta numérica decimales
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Recta numérica decimales', 'both', 234, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Recta numérica decimales', 'both', 234, null)
    on conflict do nothing;
  -- Encuesta
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Encuesta', 'both', 235, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Encuesta', 'both', 235, null)
    on conflict do nothing;
  -- Gráfica de barra
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Gráfica de barra', 'taller_ii', 236, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Gráfica de barra', 'taller_ii', 236, null)
    on conflict do nothing;
  -- Gráfica de pastel
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Gráfica de pastel', 'taller_ii', 237, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Gráfica de pastel', 'taller_ii', 237, null)
    on conflict do nothing;
  -- Media, moda, mediana
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Media, moda, mediana', 'both', 238, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Media, moda, mediana', 'both', 238, null)
    on conflict do nothing;
  -- Promedio
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Promedio', 'both', 239, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Promedio', 'both', 239, null)
    on conflict do nothing;
  -- Plano cartesiano
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Plano cartesiano', 'taller_ii', 240, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Plano cartesiano', 'taller_ii', 240, null)
    on conflict do nothing;
  -- Planos y/o mapas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Planos y/o mapas', 'both', 241, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Planos y/o mapas', 'both', 241, null)
    on conflict do nothing;
end $block$;

-- === Geometría ===
do $block$
declare
  v_plane_i uuid;
  v_plane_ii uuid;
  v_area_i uuid;
  v_area_ii uuid;
  v_cat_i uuid;
  v_cat_ii uuid;
begin
  select id into v_plane_i from development_planes where slug = 'taller-i';
  select id into v_plane_ii from development_planes where slug = 'taller-ii';

  insert into curriculum_areas (plane_id, name, color, sort_order)
    values (v_plane_i, 'Geometría', '#3b82f6', 4)
    on conflict do nothing
    returning id into v_area_i;
  if v_area_i is null then
    select id into v_area_i from curriculum_areas where plane_id = v_plane_i and name = 'Geometría';
  end if;

  insert into curriculum_areas (plane_id, name, color, sort_order)
    values (v_plane_ii, 'Geometría', '#3b82f6', 4)
    on conflict do nothing
    returning id into v_area_ii;
  if v_area_ii is null then
    select id into v_area_ii from curriculum_areas where plane_id = v_plane_ii and name = 'Geometría';
  end if;

  insert into curriculum_categories (area_id, name, sort_order)
    values (v_area_i, 'Geometría', 0)
    on conflict do nothing
    returning id into v_cat_i;
  if v_cat_i is null then
    select id into v_cat_i from curriculum_categories where area_id = v_area_i and name = 'Geometría';
  end if;

  insert into curriculum_categories (area_id, name, sort_order)
    values (v_area_ii, 'Geometría', 0)
    on conflict do nothing
    returning id into v_cat_ii;
  if v_cat_ii is null then
    select id into v_cat_ii from curriculum_categories where area_id = v_area_ii and name = 'Geometría';
  end if;

  -- Introducción a la geometría
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción a la geometría', 'taller_i', 0, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción a la geometría', 'taller_i', 0, null)
    on conflict do nothing;
  -- Historia
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Historia', 'both', 1, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Historia', 'both', 1, null)
    on conflict do nothing;
  -- Congruencia, similitud y equivalencia
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Congruencia, similitud y equivalencia', 'taller_i', 2, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Congruencia, similitud y equivalencia', 'taller_i', 2, null)
    on conflict do nothing;
  -- Concepto de congruencia
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Concepto de congruencia', 'taller_i', 3, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Concepto de congruencia', 'taller_i', 3, null)
    on conflict do nothing;
  -- concepto de similitud
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'concepto de similitud', 'both', 4, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'concepto de similitud', 'both', 4, null)
    on conflict do nothing;
  -- Trabajando con los tres conceptos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Trabajando con los tres conceptos', 'both', 5, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Trabajando con los tres conceptos', 'both', 5, null)
    on conflict do nothing;
  -- Equivalencia
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Equivalencia', 'both', 6, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Equivalencia', 'both', 6, null)
    on conflict do nothing;
  -- Presentación del concepto y nombre
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Presentación del concepto y nombre', 'both', 7, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Presentación del concepto y nombre', 'both', 7, null)
    on conflict do nothing;
  -- Uso de fracciones (material triangular)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Uso de fracciones (material triangular)', 'both', 8, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Uso de fracciones (material triangular)', 'both', 8, null)
    on conflict do nothing;
  -- Equivalencia con figuras no geométricas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Equivalencia con figuras no geométricas', 'both', 9, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Equivalencia con figuras no geométricas', 'both', 9, null)
    on conflict do nothing;
  -- Equivalencias con los triángulos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Equivalencias con los triángulos', 'taller_i', 10, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Equivalencias con los triángulos', 'taller_i', 10, null)
    on conflict do nothing;
  -- Caja triángular
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Caja triángular', 'both', 11, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Caja triángular', 'both', 11, null)
    on conflict do nothing;
  -- Caja hexagonal chica
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Caja hexagonal chica', 'both', 12, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Caja hexagonal chica', 'both', 12, null)
    on conflict do nothing;
  -- Caja hexagonal grande
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Caja hexagonal grande', 'both', 13, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Caja hexagonal grande', 'both', 13, null)
    on conflict do nothing;
  -- Combinando cajas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Combinando cajas', 'both', 14, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Combinando cajas', 'both', 14, null)
    on conflict do nothing;
  -- Caja con 12 triángulos escalenos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Caja con 12 triángulos escalenos', 'taller_i', 15, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Caja con 12 triángulos escalenos', 'taller_i', 15, null)
    on conflict do nothing;
  -- Polígonos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Polígonos', 'taller_i', 16, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Polígonos', 'taller_i', 16, null)
    on conflict do nothing;
  -- Presentación de conceptos y nombres
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Presentación de conceptos y nombres', 'both', 17, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Presentación de conceptos y nombres', 'both', 17, null)
    on conflict do nothing;
  -- El triángulo como constructor
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'El triángulo como constructor', 'both', 18, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'El triángulo como constructor', 'both', 18, null)
    on conflict do nothing;
  -- Espacio cerrado por líneas curvas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Espacio cerrado por líneas curvas', 'both', 19, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Espacio cerrado por líneas curvas', 'both', 19, null)
    on conflict do nothing;
  -- Nomenclatura clasificada
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Nomenclatura clasificada', 'both', 20, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Nomenclatura clasificada', 'both', 20, null)
    on conflict do nothing;
  -- Ángulos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Ángulos', 'taller_i', 21, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Ángulos', 'taller_i', 21, null)
    on conflict do nothing;
  -- Presentación del concepto
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Presentación del concepto', 'both', 22, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Presentación del concepto', 'both', 22, null)
    on conflict do nothing;
  -- Tipos de ángulos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tipos de ángulos', 'taller_i', 23, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tipos de ángulos', 'taller_i', 23, null)
    on conflict do nothing;
  -- Clasificación de triángulos por ángulos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Clasificación de triángulos por ángulos', 'taller_i', 24, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Clasificación de triángulos por ángulos', 'taller_i', 24, null)
    on conflict do nothing;
  -- Clasificación de triángulos por lados
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Clasificación de triángulos por lados', 'taller_i', 25, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Clasificación de triángulos por lados', 'taller_i', 25, null)
    on conflict do nothing;
  -- Clasifiación de triángulos por lados y ángulos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Clasifiación de triángulos por lados y ángulos', 'taller_i', 26, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Clasifiación de triángulos por lados y ángulos', 'taller_i', 26, null)
    on conflict do nothing;
  -- Partes de un ángulo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Partes de un ángulo', 'both', 27, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Partes de un ángulo', 'both', 27, null)
    on conflict do nothing;
  -- Cómo medir ángulos (transportador montessori)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cómo medir ángulos (transportador montessori)', 'taller_i', 28, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cómo medir ángulos (transportador montessori)', 'taller_i', 28, null)
    on conflict do nothing;
  -- Operaciones con ángulos (+, -, x, /)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Operaciones con ángulos (+, -, x, /)', 'taller_i', 29, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Operaciones con ángulos (+, -, x, /)', 'taller_i', 29, null)
    on conflict do nothing;
  -- Uso del tranportador comercial
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Uso del tranportador comercial', 'both', 30, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Uso del tranportador comercial', 'both', 30, null)
    on conflict do nothing;
  -- Bisectando un ángulo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Bisectando un ángulo', 'both', 31, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Bisectando un ángulo', 'both', 31, null)
    on conflict do nothing;
  -- Relación entre pares de ángulos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Relación entre pares de ángulos', 'taller_i', 32, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Relación entre pares de ángulos', 'taller_i', 32, null)
    on conflict do nothing;
  -- Relación de ángulos formados por líneas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Relación de ángulos formados por líneas', 'taller_i', 33, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Relación de ángulos formados por líneas', 'taller_i', 33, null)
    on conflict do nothing;
  -- Paralelas y transversal
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Paralelas y transversal', 'both', 34, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Paralelas y transversal', 'both', 34, null)
    on conflict do nothing;
  -- Relación de ángulos correspondientes y alternos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Relación de ángulos correspondientes y alternos', 'taller_i', 35, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Relación de ángulos correspondientes y alternos', 'taller_i', 35, null)
    on conflict do nothing;
  -- Líneas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Líneas', 'both', 36, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Líneas', 'both', 36, null)
    on conflict do nothing;
  -- Tipo de líneas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tipo de líneas', 'taller_i', 37, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tipo de líneas', 'taller_i', 37, null)
    on conflict do nothing;
  -- Partes de una línea recta
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Partes de una línea recta', 'both', 38, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Partes de una línea recta', 'both', 38, null)
    on conflict do nothing;
  -- Posición de las líneas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Posición de las líneas', 'both', 39, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Posición de las líneas', 'both', 39, null)
    on conflict do nothing;
  -- Posición de dos líneas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Posición de dos líneas', 'both', 40, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Posición de dos líneas', 'both', 40, null)
    on conflict do nothing;
  -- Ejercicios siguientes
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Ejercicios siguientes', 'both', 41, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Ejercicios siguientes', 'both', 41, null)
    on conflict do nothing;
  -- Teorema de Pitágoras
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Teorema de Pitágoras', 'taller_ii', 42, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Teorema de Pitágoras', 'taller_ii', 42, null)
    on conflict do nothing;
  -- Introducción
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción', 'both', 43, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción', 'both', 43, null)
    on conflict do nothing;
  -- Primer resaque: el concepto
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Primer resaque: el concepto', 'both', 44, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Primer resaque: el concepto', 'both', 44, null)
    on conflict do nothing;
  -- Segundo resaque
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Segundo resaque', 'both', 45, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Segundo resaque', 'both', 45, null)
    on conflict do nothing;
  -- Teorema de Pitágoras con los triángulos contruc.
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Teorema de Pitágoras con los triángulos contruc.', 'taller_i', 46, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Teorema de Pitágoras con los triángulos contruc.', 'taller_i', 46, null)
    on conflict do nothing;
  -- Ejercicios siguientes
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Ejercicios siguientes', 'both', 47, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Ejercicios siguientes', 'both', 47, null)
    on conflict do nothing;
  -- Teorema de Euclides
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Teorema de Euclides', 'taller_ii', 48, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Teorema de Euclides', 'taller_ii', 48, null)
    on conflict do nothing;
  -- Presentación sensorial
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Presentación sensorial', 'both', 49, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Presentación sensorial', 'both', 49, null)
    on conflict do nothing;
  -- Nivel de razonamiento
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Nivel de razonamiento', 'both', 50, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Nivel de razonamiento', 'both', 50, null)
    on conflict do nothing;
  -- Ejercicios siguientes
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Ejercicios siguientes', 'both', 51, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Ejercicios siguientes', 'both', 51, null)
    on conflict do nothing;
  -- Nomenclatura de polígonos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Nomenclatura de polígonos', 'taller_i', 52, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Nomenclatura de polígonos', 'taller_i', 52, null)
    on conflict do nothing;
  -- Partes de un polígono
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Partes de un polígono', 'both', 53, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Partes de un polígono', 'both', 53, null)
    on conflict do nothing;
  -- Partes de un triángulo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Partes de un triángulo', 'both', 54, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Partes de un triángulo', 'both', 54, null)
    on conflict do nothing;
  -- Partes del rombo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Partes del rombo', 'both', 55, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Partes del rombo', 'both', 55, null)
    on conflict do nothing;
  -- Partes del trapecio
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Partes del trapecio', 'both', 56, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Partes del trapecio', 'both', 56, null)
    on conflict do nothing;
  -- Cómo encontrar el centro de un polígono
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cómo encontrar el centro de un polígono', 'both', 57, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cómo encontrar el centro de un polígono', 'both', 57, null)
    on conflict do nothing;
  -- Partes adicionales de un polígono
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Partes adicionales de un polígono', 'both', 58, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Partes adicionales de un polígono', 'both', 58, null)
    on conflict do nothing;
  -- Suma de ángulos en figuras planas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Suma de ángulos en figuras planas', 'taller_i', 59, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Suma de ángulos en figuras planas', 'taller_i', 59, null)
    on conflict do nothing;
  -- Suma de ángulos del triángulo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Suma de ángulos del triángulo', 'taller_i', 60, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Suma de ángulos del triángulo', 'taller_i', 60, null)
    on conflict do nothing;
  -- Suma de ángulos del cuadrilatero
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Suma de ángulos del cuadrilatero', 'taller_i', 61, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Suma de ángulos del cuadrilatero', 'taller_i', 61, null)
    on conflict do nothing;
  -- Suma de ángulos del trapezoide
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Suma de ángulos del trapezoide', 'taller_i', 62, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Suma de ángulos del trapezoide', 'taller_i', 62, null)
    on conflict do nothing;
  -- Suma de polígonos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Suma de polígonos', 'taller_i', 63, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Suma de polígonos', 'taller_i', 63, null)
    on conflict do nothing;
  -- Equivalencia con material metálico
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Equivalencia con material metálico', 'both', 64, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Equivalencia con material metálico', 'both', 64, null)
    on conflict do nothing;
  -- Triángulo y rectángulo / rombo y rectángulo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Triángulo y rectángulo / rombo y rectángulo', 'both', 65, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Triángulo y rectángulo / rombo y rectángulo', 'both', 65, null)
    on conflict do nothing;
  -- Trapezoide y rectángulo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Trapezoide y rectángulo', 'both', 66, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Trapezoide y rectángulo', 'both', 66, null)
    on conflict do nothing;
  -- Decágonos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Decágonos', 'both', 67, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Decágonos', 'both', 67, null)
    on conflict do nothing;
  -- Set 1
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Set 1', 'both', 68, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Set 1', 'both', 68, null)
    on conflict do nothing;
  -- Set 2
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Set 2', 'both', 69, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Set 2', 'both', 69, null)
    on conflict do nothing;
  -- Área de figuras planas (material amarillo)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Área de figuras planas (material amarillo)', 'both', 70, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Área de figuras planas (material amarillo)', 'both', 70, null)
    on conflict do nothing;
  -- Exploración sensorial
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Exploración sensorial', 'both', 71, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Exploración sensorial', 'both', 71, null)
    on conflict do nothing;
  -- Rectángulo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Rectángulo', 'both', 72, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Rectángulo', 'both', 72, null)
    on conflict do nothing;
  -- Paralelogramo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Paralelogramo', 'both', 73, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Paralelogramo', 'both', 73, null)
    on conflict do nothing;
  -- Triángulo acutángulo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Triángulo acutángulo', 'both', 74, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Triángulo acutángulo', 'both', 74, null)
    on conflict do nothing;
  -- Triángulo rectángulo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Triángulo rectángulo', 'both', 75, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Triángulo rectángulo', 'both', 75, null)
    on conflict do nothing;
  -- Triángulo obtusángulo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Triángulo obtusángulo', 'both', 76, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Triángulo obtusángulo', 'both', 76, null)
    on conflict do nothing;
  -- Áreas y derivación de fórmulas (material metálico)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Áreas y derivación de fórmulas (material metálico)', 'taller_ii', 77, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Áreas y derivación de fórmulas (material metálico)', 'taller_ii', 77, null)
    on conflict do nothing;
  -- Triángulo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Triángulo', 'both', 78, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Triángulo', 'both', 78, null)
    on conflict do nothing;
  -- Rombo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Rombo', 'both', 79, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Rombo', 'both', 79, null)
    on conflict do nothing;
  -- Posición convencional del rombo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Posición convencional del rombo', 'both', 80, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Posición convencional del rombo', 'both', 80, null)
    on conflict do nothing;
  -- Dividiendo la diagonal mayor
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Dividiendo la diagonal mayor', 'both', 81, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Dividiendo la diagonal mayor', 'both', 81, null)
    on conflict do nothing;
  -- Dividiendo la diagonal menor
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Dividiendo la diagonal menor', 'both', 82, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Dividiendo la diagonal menor', 'both', 82, null)
    on conflict do nothing;
  -- Doblando el rombo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Doblando el rombo', 'both', 83, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Doblando el rombo', 'both', 83, null)
    on conflict do nothing;
  -- Trapecio
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Trapecio', 'both', 84, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Trapecio', 'both', 84, null)
    on conflict do nothing;
  -- Decágono
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Decágono', 'both', 85, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Decágono', 'both', 85, null)
    on conflict do nothing;
  -- Dividiendo el perímetro a la mitad (encontrar área)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Dividiendo el perímetro a la mitad (encontrar área)', 'both', 86, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Dividiendo el perímetro a la mitad (encontrar área)', 'both', 86, null)
    on conflict do nothing;
  -- Dividiendo la apotema a la mitad (encontrar área)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Dividiendo la apotema a la mitad (encontrar área)', 'both', 87, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Dividiendo la apotema a la mitad (encontrar área)', 'both', 87, null)
    on conflict do nothing;
  -- Doblando el rectángulo (encontrar área del polígono)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Doblando el rectángulo (encontrar área del polígono)', 'both', 88, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Doblando el rectángulo (encontrar área del polígono)', 'both', 88, null)
    on conflict do nothing;
  -- Nomenclatura del círculo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Nomenclatura del círculo', 'both', 89, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Nomenclatura del círculo', 'both', 89, null)
    on conflict do nothing;
  -- Términos básicos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Términos básicos', 'both', 90, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Términos básicos', 'both', 90, null)
    on conflict do nothing;
  -- Términos adicionales
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Términos adicionales', 'both', 91, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Términos adicionales', 'both', 91, null)
    on conflict do nothing;
  -- Relación de una línea respecto a la circuenferencia
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Relación de una línea respecto a la circuenferencia', 'both', 92, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Relación de una línea respecto a la circuenferencia', 'both', 92, null)
    on conflict do nothing;
  -- Relación entre el centro del círculo y las líneas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Relación entre el centro del círculo y las líneas', 'both', 93, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Relación entre el centro del círculo y las líneas', 'both', 93, null)
    on conflict do nothing;
  -- Relación entre circunferencias
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Relación entre circunferencias', 'both', 94, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Relación entre circunferencias', 'both', 94, null)
    on conflict do nothing;
  -- Relación entre los centros de las circunferencias
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Relación entre los centros de las circunferencias', 'both', 95, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Relación entre los centros de las circunferencias', 'both', 95, null)
    on conflict do nothing;
  -- Otros términos de la circunferencia
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Otros términos de la circunferencia', 'both', 96, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Otros términos de la circunferencia', 'both', 96, null)
    on conflict do nothing;
  -- Área del círculo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Área del círculo', 'taller_ii', 97, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Área del círculo', 'taller_ii', 97, null)
    on conflict do nothing;
  -- El círculo como un polígono especial
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'El círculo como un polígono especial', 'both', 98, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'El círculo como un polígono especial', 'both', 98, null)
    on conflict do nothing;
  -- Midiendo el círculo encontrando
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Midiendo el círculo encontrando', 'both', 99, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Midiendo el círculo encontrando', 'both', 99, null)
    on conflict do nothing;
  -- Relación entre la apotema de un lado con figura plana
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Relación entre la apotema de un lado con figura plana', 'both', 100, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Relación entre la apotema de un lado con figura plana', 'both', 100, null)
    on conflict do nothing;
  -- Geometría sólida
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Geometría sólida', 'both', 101, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Geometría sólida', 'both', 101, null)
    on conflict do nothing;
  -- Exploración sensorial de volúmen
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Exploración sensorial de volúmen', 'both', 102, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Exploración sensorial de volúmen', 'both', 102, null)
    on conflict do nothing;
  -- Equivalencia en relación con figuras sólidas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Equivalencia en relación con figuras sólidas', 'both', 103, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Equivalencia en relación con figuras sólidas', 'both', 103, null)
    on conflict do nothing;
  -- Equivalencias entre prismas con diferentes bases
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Equivalencias entre prismas con diferentes bases', 'both', 104, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Equivalencias entre prismas con diferentes bases', 'both', 104, null)
    on conflict do nothing;
  -- Prisma romboidal
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Prisma romboidal', 'both', 105, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Prisma romboidal', 'both', 105, null)
    on conflict do nothing;
  -- Prisma hexagonal
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Prisma hexagonal', 'both', 106, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Prisma hexagonal', 'both', 106, null)
    on conflict do nothing;
  -- Derivaando la fórmula de volúmen
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Derivaando la fórmula de volúmen', 'both', 107, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Derivaando la fórmula de volúmen', 'both', 107, null)
    on conflict do nothing;
  -- Sólidos en rotación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Sólidos en rotación', 'taller_i', 108, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Sólidos en rotación', 'taller_i', 108, null)
    on conflict do nothing;
  -- Volúmen de la pirámide
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Volúmen de la pirámide', 'both', 109, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Volúmen de la pirámide', 'both', 109, null)
    on conflict do nothing;
  -- Pirámide y prisma rectángular
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Pirámide y prisma rectángular', 'both', 110, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Pirámide y prisma rectángular', 'both', 110, null)
    on conflict do nothing;
  -- Pirámide y prisma rectangular pequeño
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Pirámide y prisma rectangular pequeño', 'both', 111, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Pirámide y prisma rectangular pequeño', 'both', 111, null)
    on conflict do nothing;
  -- Cilindro y cono
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cilindro y cono', 'both', 112, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cilindro y cono', 'both', 112, null)
    on conflict do nothing;
  -- Poliedros
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Poliedros', 'taller_ii', 113, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Poliedros', 'taller_ii', 113, null)
    on conflict do nothing;
  -- Concepto de poliedro
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Concepto de poliedro', 'both', 114, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Concepto de poliedro', 'both', 114, null)
    on conflict do nothing;
  -- Nomenclatura de poliedros
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Nomenclatura de poliedros', 'taller_ii', 115, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Nomenclatura de poliedros', 'taller_ii', 115, null)
    on conflict do nothing;
  -- Área total y lateral de los sólidos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Área total y lateral de los sólidos', 'taller_ii', 116, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Área total y lateral de los sólidos', 'taller_ii', 116, null)
    on conflict do nothing;
  -- Prisma rectangular
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Prisma rectangular', 'both', 117, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Prisma rectangular', 'both', 117, null)
    on conflict do nothing;
  -- Prisma triangular
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Prisma triangular', 'both', 118, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Prisma triangular', 'both', 118, null)
    on conflict do nothing;
  -- Cilindro
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cilindro', 'both', 119, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cilindro', 'both', 119, null)
    on conflict do nothing;
  -- Pirámide triángular
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Pirámide triángular', 'both', 120, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Pirámide triángular', 'both', 120, null)
    on conflict do nothing;
  -- Cono
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cono', 'both', 121, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cono', 'both', 121, null)
    on conflict do nothing;
  -- Órdenes de geometría
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Órdenes de geometría', 'both', 122, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Órdenes de geometría', 'both', 122, null)
    on conflict do nothing;
  -- Cartelones de geometría
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cartelones de geometría', 'both', 123, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cartelones de geometría', 'both', 123, null)
    on conflict do nothing;
  -- Nomenclatura de geometría
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Nomenclatura de geometría', 'both', 124, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Nomenclatura de geometría', 'both', 124, null)
    on conflict do nothing;
end $block$;

-- === Biología ===
do $block$
declare
  v_plane_i uuid;
  v_plane_ii uuid;
  v_area_i uuid;
  v_area_ii uuid;
  v_cat_i uuid;
  v_cat_ii uuid;
begin
  select id into v_plane_i from development_planes where slug = 'taller-i';
  select id into v_plane_ii from development_planes where slug = 'taller-ii';

  insert into curriculum_areas (plane_id, name, color, sort_order)
    values (v_plane_i, 'Biología', '#22c55e', 5)
    on conflict do nothing
    returning id into v_area_i;
  if v_area_i is null then
    select id into v_area_i from curriculum_areas where plane_id = v_plane_i and name = 'Biología';
  end if;

  insert into curriculum_areas (plane_id, name, color, sort_order)
    values (v_plane_ii, 'Biología', '#22c55e', 5)
    on conflict do nothing
    returning id into v_area_ii;
  if v_area_ii is null then
    select id into v_area_ii from curriculum_areas where plane_id = v_plane_ii and name = 'Biología';
  end if;

  insert into curriculum_categories (area_id, name, sort_order)
    values (v_area_i, 'Biología', 0)
    on conflict do nothing
    returning id into v_cat_i;
  if v_cat_i is null then
    select id into v_cat_i from curriculum_categories where area_id = v_area_i and name = 'Biología';
  end if;

  insert into curriculum_categories (area_id, name, sort_order)
    values (v_area_ii, 'Biología', 0)
    on conflict do nothing
    returning id into v_cat_ii;
  if v_cat_ii is null then
    select id into v_cat_ii from curriculum_categories where area_id = v_area_ii and name = 'Biología';
  end if;

  -- Introducción a la biología
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción a la biología', 'both', 0, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción a la biología', 'both', 0, null)
    on conflict do nothing;
  -- Botánica
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Botánica', 'taller_i', 1, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Botánica', 'taller_i', 1, null)
    on conflict do nothing;
  -- Necesidades de la planta
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Necesidades de la planta', 'both', 2, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Necesidades de la planta', 'both', 2, null)
    on conflict do nothing;
  -- Necesidades de las plantas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Necesidades de las plantas', 'both', 3, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Necesidades de las plantas', 'both', 3, null)
    on conflict do nothing;
  -- Las plantas crecen hacia la luz
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Las plantas crecen hacia la luz', 'both', 4, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Las plantas crecen hacia la luz', 'both', 4, null)
    on conflict do nothing;
  -- Las plantas necesitan minerales
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Las plantas necesitan minerales', 'both', 5, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Las plantas necesitan minerales', 'both', 5, null)
    on conflict do nothing;
  -- La hoja
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'La hoja', 'taller_i', 6, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'La hoja', 'taller_i', 6, null)
    on conflict do nothing;
  -- Función principal
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Función principal', 'both', 7, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Función principal', 'both', 7, null)
    on conflict do nothing;
  -- Otra función (estomas)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Otra función (estomas)', 'both', 8, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Otra función (estomas)', 'both', 8, null)
    on conflict do nothing;
  -- Otra función (oxígeno)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Otra función (oxígeno)', 'both', 9, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Otra función (oxígeno)', 'both', 9, null)
    on conflict do nothing;
  -- Partes de la hoja
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Partes de la hoja', 'taller_i', 10, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Partes de la hoja', 'taller_i', 10, null)
    on conflict do nothing;
  -- Variedades en las hojas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Variedades en las hojas', 'both', 11, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Variedades en las hojas', 'both', 11, null)
    on conflict do nothing;
  -- Clasificación simple
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Clasificación simple', 'both', 12, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Clasificación simple', 'both', 12, null)
    on conflict do nothing;
  -- Variedades según su función
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Variedades según su función', 'both', 13, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Variedades según su función', 'both', 13, null)
    on conflict do nothing;
  -- Ejercicios siguientes
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Ejercicios siguientes', 'both', 14, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Ejercicios siguientes', 'both', 14, null)
    on conflict do nothing;
  -- La raíz
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'La raíz', 'taller_i', 15, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'La raíz', 'taller_i', 15, null)
    on conflict do nothing;
  -- Función principal (experimentos)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Función principal (experimentos)', 'both', 16, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Función principal (experimentos)', 'both', 16, null)
    on conflict do nothing;
  -- Función principal (historia)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Función principal (historia)', 'both', 17, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Función principal (historia)', 'both', 17, null)
    on conflict do nothing;
  -- Partes de la raíz
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Partes de la raíz', 'taller_i', 18, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Partes de la raíz', 'taller_i', 18, null)
    on conflict do nothing;
  -- Colaboración entre raíces y hojas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Colaboración entre raíces y hojas', 'both', 19, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Colaboración entre raíces y hojas', 'both', 19, null)
    on conflict do nothing;
  -- Otras funciones (deteniendo la tierra)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Otras funciones (deteniendo la tierra)', 'both', 20, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Otras funciones (deteniendo la tierra)', 'both', 20, null)
    on conflict do nothing;
  -- Otras funciones (previniendo la erosión)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Otras funciones (previniendo la erosión)', 'taller_ii', 21, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Otras funciones (previniendo la erosión)', 'taller_ii', 21, null)
    on conflict do nothing;
  -- Dos princiaples tipos de raíces
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Dos princiaples tipos de raíces', 'both', 22, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Dos princiaples tipos de raíces', 'both', 22, null)
    on conflict do nothing;
  -- Otra sensibilidad (a las raíces no les gusta la luz)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Otra sensibilidad (a las raíces no les gusta la luz)', 'both', 23, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Otra sensibilidad (a las raíces no les gusta la luz)', 'both', 23, null)
    on conflict do nothing;
  -- Otra sensibilidad (las raíces crecen hacia la tierra)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Otra sensibilidad (las raíces crecen hacia la tierra)', 'both', 24, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Otra sensibilidad (las raíces crecen hacia la tierra)', 'both', 24, null)
    on conflict do nothing;
  -- Variedades de las raíces
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Variedades de las raíces', 'both', 25, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Variedades de las raíces', 'both', 25, null)
    on conflict do nothing;
  -- Ejercicios siguientes
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Ejercicios siguientes', 'both', 26, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Ejercicios siguientes', 'both', 26, null)
    on conflict do nothing;
  -- El tallo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'El tallo', 'taller_i', 27, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'El tallo', 'taller_i', 27, null)
    on conflict do nothing;
  -- Función principal
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Función principal', 'both', 28, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Función principal', 'both', 28, null)
    on conflict do nothing;
  -- Dos princiaples tipos de tallos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Dos princiaples tipos de tallos', 'both', 29, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Dos princiaples tipos de tallos', 'both', 29, null)
    on conflict do nothing;
  -- Partes del tallo leñoso
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Partes del tallo leñoso', 'taller_i', 30, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Partes del tallo leñoso', 'taller_i', 30, null)
    on conflict do nothing;
  -- Otras partes del tallo leñoso
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Otras partes del tallo leñoso', 'taller_i', 31, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Otras partes del tallo leñoso', 'taller_i', 31, null)
    on conflict do nothing;
  -- ¿Cómo se mueve el agua a través del tallo?
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, '¿Cómo se mueve el agua a través del tallo?', 'taller_i', 32, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, '¿Cómo se mueve el agua a través del tallo?', 'taller_i', 32, null)
    on conflict do nothing;
  -- Variedades en los tallos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Variedades en los tallos', 'both', 33, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Variedades en los tallos', 'both', 33, null)
    on conflict do nothing;
  -- Ejercicios siguientes
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Ejercicios siguientes', 'both', 34, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Ejercicios siguientes', 'both', 34, null)
    on conflict do nothing;
  -- La flor
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'La flor', 'taller_i', 35, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'La flor', 'taller_i', 35, null)
    on conflict do nothing;
  -- Función principal
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Función principal', 'both', 36, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Función principal', 'both', 36, null)
    on conflict do nothing;
  -- Partes de la flor
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Partes de la flor', 'taller_i', 37, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Partes de la flor', 'taller_i', 37, null)
    on conflict do nothing;
  -- Variedades en las partes de la flor
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Variedades en las partes de la flor', 'taller_i', 38, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Variedades en las partes de la flor', 'taller_i', 38, null)
    on conflict do nothing;
  -- Especialidades de la flor que asefuran la polinización
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Especialidades de la flor que asefuran la polinización', 'taller_i', 39, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Especialidades de la flor que asefuran la polinización', 'taller_i', 39, null)
    on conflict do nothing;
  -- Ejercicios siguientes
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Ejercicios siguientes', 'both', 40, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Ejercicios siguientes', 'both', 40, null)
    on conflict do nothing;
  -- El fruto
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'El fruto', 'taller_i', 41, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'El fruto', 'taller_i', 41, null)
    on conflict do nothing;
  -- Función principal
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Función principal', 'both', 42, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Función principal', 'both', 42, null)
    on conflict do nothing;
  -- Tipos de frutos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tipos de frutos', 'both', 43, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tipos de frutos', 'both', 43, null)
    on conflict do nothing;
  -- Partes de un fruto suculento
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Partes de un fruto suculento', 'both', 44, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Partes de un fruto suculento', 'both', 44, null)
    on conflict do nothing;
  -- Otra forma de observar un fruto (partes de la flor)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Otra forma de observar un fruto (partes de la flor)', 'taller_i', 45, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Otra forma de observar un fruto (partes de la flor)', 'taller_i', 45, null)
    on conflict do nothing;
  -- Tipos de frutos secos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tipos de frutos secos', 'both', 46, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tipos de frutos secos', 'both', 46, null)
    on conflict do nothing;
  -- Ejercicios siguientes
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Ejercicios siguientes', 'both', 47, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Ejercicios siguientes', 'both', 47, null)
    on conflict do nothing;
  -- La semilla
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'La semilla', 'taller_i', 48, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'La semilla', 'taller_i', 48, null)
    on conflict do nothing;
  -- Función principal
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Función principal', 'both', 49, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Función principal', 'both', 49, null)
    on conflict do nothing;
  -- Partes de la semilla
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Partes de la semilla', 'taller_i', 50, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Partes de la semilla', 'taller_i', 50, null)
    on conflict do nothing;
  -- Tipos de semillas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tipos de semillas', 'both', 51, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tipos de semillas', 'both', 51, null)
    on conflict do nothing;
  -- Clasifiación simple
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Clasifiación simple', 'both', 52, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Clasifiación simple', 'both', 52, null)
    on conflict do nothing;
  -- Dispersión  de las semillas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Dispersión  de las semillas', 'both', 53, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Dispersión  de las semillas', 'both', 53, null)
    on conflict do nothing;
  -- Ejercicios siguientes
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Ejercicios siguientes', 'both', 54, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Ejercicios siguientes', 'both', 54, null)
    on conflict do nothing;
  -- Nomenclatura de botánica
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Nomenclatura de botánica', 'taller_i', 55, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Nomenclatura de botánica', 'taller_i', 55, null)
    on conflict do nothing;
  -- Órdenes de botánica (experimentos)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Órdenes de botánica (experimentos)', 'taller_i', 56, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Órdenes de botánica (experimentos)', 'taller_i', 56, null)
    on conflict do nothing;
  -- Set 1
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Set 1', 'both', 57, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Set 1', 'both', 57, null)
    on conflict do nothing;
  -- Set 2
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Set 2', 'both', 58, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Set 2', 'both', 58, null)
    on conflict do nothing;
  -- Set 3
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Set 3', 'both', 59, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Set 3', 'both', 59, null)
    on conflict do nothing;
  -- Preparación para el uso del microscopio
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Preparación para el uso del microscopio', 'both', 60, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Preparación para el uso del microscopio', 'both', 60, null)
    on conflict do nothing;
  -- Clasificación científica
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Clasificación científica', 'taller_ii', 61, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Clasificación científica', 'taller_ii', 61, null)
    on conflict do nothing;
  -- Una forma de iniciar la clasifiación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Una forma de iniciar la clasifiación', 'both', 62, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Una forma de iniciar la clasifiación', 'both', 62, null)
    on conflict do nothing;
  -- Reino Vegetal
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Reino Vegetal', 'both', 63, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Reino Vegetal', 'both', 63, null)
    on conflict do nothing;
  -- División: Fanerógamas y Criptóganas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'División: Fanerógamas y Criptóganas', 'both', 64, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'División: Fanerógamas y Criptóganas', 'both', 64, null)
    on conflict do nothing;
  -- Clase: Monocotiledónea y Dicotiledonea
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Clase: Monocotiledónea y Dicotiledonea', 'both', 65, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Clase: Monocotiledónea y Dicotiledonea', 'both', 65, null)
    on conflict do nothing;
  -- Subclase: Archichlamydae y Metachlamydae
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Subclase: Archichlamydae y Metachlamydae', 'both', 66, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Subclase: Archichlamydae y Metachlamydae', 'both', 66, null)
    on conflict do nothing;
  -- Otra forma de iniciar la clasificación científica
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Otra forma de iniciar la clasificación científica', 'taller_ii', 67, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Otra forma de iniciar la clasificación científica', 'taller_ii', 67, null)
    on conflict do nothing;
  -- Familias
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Familias', 'both', 68, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Familias', 'both', 68, null)
    on conflict do nothing;
  -- Libros de trabajo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Libros de trabajo', 'both', 69, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Libros de trabajo', 'both', 69, null)
    on conflict do nothing;
  -- Nivel: Género
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Nivel: Género', 'both', 70, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Nivel: Género', 'both', 70, null)
    on conflict do nothing;
  -- Genealogía
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Genealogía', 'both', 71, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Genealogía', 'both', 71, null)
    on conflict do nothing;
  -- Árbol de clasificación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Árbol de clasificación', 'both', 72, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Árbol de clasificación', 'both', 72, null)
    on conflict do nothing;
  -- Zoología
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Zoología', 'both', 73, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Zoología', 'both', 73, null)
    on conflict do nothing;
  -- Historias de los animales
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Historias de los animales', 'taller_i', 74, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Historias de los animales', 'taller_i', 74, null)
    on conflict do nothing;
  -- Historias
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Historias', 'both', 75, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Historias', 'both', 75, null)
    on conflict do nothing;
  -- Adivinanzas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Adivinanzas', 'both', 76, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Adivinanzas', 'both', 76, null)
    on conflict do nothing;
  -- Juego de clasificación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Juego de clasificación', 'both', 77, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Juego de clasificación', 'both', 77, null)
    on conflict do nothing;
  -- Partes internas de los animales
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Partes internas de los animales', 'both', 78, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Partes internas de los animales', 'both', 78, null)
    on conflict do nothing;
  -- Actividades preliminares
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Actividades preliminares', 'both', 79, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Actividades preliminares', 'both', 79, null)
    on conflict do nothing;
  -- Nombres de las 5 clases de vertebrados
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Nombres de las 5 clases de vertebrados', 'both', 80, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Nombres de las 5 clases de vertebrados', 'both', 80, null)
    on conflict do nothing;
  -- Funciones de cada clase
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Funciones de cada clase', 'both', 81, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Funciones de cada clase', 'both', 81, null)
    on conflict do nothing;
  -- Comparando las 5 clases
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Comparando las 5 clases', 'both', 82, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Comparando las 5 clases', 'both', 82, null)
    on conflict do nothing;
  -- Introducción a los invetebrados
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción a los invetebrados', 'both', 83, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción a los invetebrados', 'both', 83, null)
    on conflict do nothing;
  -- Características de los grupos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Características de los grupos', 'both', 84, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Características de los grupos', 'both', 84, null)
    on conflict do nothing;
  -- Sobres
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Sobres', 'both', 85, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Sobres', 'both', 85, null)
    on conflict do nothing;
  -- Genealogía
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Genealogía', 'both', 86, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Genealogía', 'both', 86, null)
    on conflict do nothing;
  -- Árbol de clasificación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Árbol de clasificación', 'both', 87, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Árbol de clasificación', 'both', 87, null)
    on conflict do nothing;
  -- Ecología
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Ecología', 'taller_ii', 88, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Ecología', 'taller_ii', 88, null)
    on conflict do nothing;
  -- Interdependencia
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Interdependencia', 'taller_ii', 89, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Interdependencia', 'taller_ii', 89, null)
    on conflict do nothing;
  -- Ecología
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Ecología', 'taller_ii', 90, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Ecología', 'taller_ii', 90, null)
    on conflict do nothing;
end $block$;

-- === Geografía ===
do $block$
declare
  v_plane_i uuid;
  v_plane_ii uuid;
  v_area_i uuid;
  v_area_ii uuid;
  v_cat_i uuid;
  v_cat_ii uuid;
begin
  select id into v_plane_i from development_planes where slug = 'taller-i';
  select id into v_plane_ii from development_planes where slug = 'taller-ii';

  insert into curriculum_areas (plane_id, name, color, sort_order)
    values (v_plane_i, 'Geografía', '#f97316', 6)
    on conflict do nothing
    returning id into v_area_i;
  if v_area_i is null then
    select id into v_area_i from curriculum_areas where plane_id = v_plane_i and name = 'Geografía';
  end if;

  insert into curriculum_areas (plane_id, name, color, sort_order)
    values (v_plane_ii, 'Geografía', '#f97316', 6)
    on conflict do nothing
    returning id into v_area_ii;
  if v_area_ii is null then
    select id into v_area_ii from curriculum_areas where plane_id = v_plane_ii and name = 'Geografía';
  end if;

  insert into curriculum_categories (area_id, name, sort_order)
    values (v_area_i, 'Geografía', 0)
    on conflict do nothing
    returning id into v_cat_i;
  if v_cat_i is null then
    select id into v_cat_i from curriculum_categories where area_id = v_area_i and name = 'Geografía';
  end if;

  insert into curriculum_categories (area_id, name, sort_order)
    values (v_area_ii, 'Geografía', 0)
    on conflict do nothing
    returning id into v_cat_ii;
  if v_cat_ii is null then
    select id into v_cat_ii from curriculum_categories where area_id = v_area_ii and name = 'Geografía';
  end if;

  -- El Dios sin manos g.l
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'El Dios sin manos g.l', 'taller_i', 0, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'El Dios sin manos g.l', 'taller_i', 0, null)
    on conflict do nothing;
  -- Historia
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Historia', 'both', 1, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Historia', 'both', 1, null)
    on conflict do nothing;
  -- Experimentos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Experimentos', 'both', 2, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Experimentos', 'both', 2, null)
    on conflict do nothing;
  -- Ejercicios siguientes (estrellas)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Ejercicios siguientes (estrellas)', 'both', 3, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Ejercicios siguientes (estrellas)', 'both', 3, null)
    on conflict do nothing;
  -- Frío, friísimo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Frío, friísimo', 'both', 4, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Frío, friísimo', 'both', 4, null)
    on conflict do nothing;
  -- El Sol
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'El Sol', 'taller_i', 5, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'El Sol', 'taller_i', 5, null)
    on conflict do nothing;
  -- Los planetas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Los planetas', 'taller_i', 6, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Los planetas', 'taller_i', 6, null)
    on conflict do nothing;
  -- Demostración 1 (tuerca)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Demostración 1 (tuerca)', 'both', 7, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Demostración 1 (tuerca)', 'both', 7, null)
    on conflict do nothing;
  -- Demostración 2 (tuerca)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Demostración 2 (tuerca)', 'both', 8, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Demostración 2 (tuerca)', 'both', 8, null)
    on conflict do nothing;
  -- Demostración 3 (tuerca)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Demostración 3 (tuerca)', 'both', 9, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Demostración 3 (tuerca)', 'both', 9, null)
    on conflict do nothing;
  -- Volcanes
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Volcanes', 'taller_i', 10, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Volcanes', 'taller_i', 10, null)
    on conflict do nothing;
  -- Composición de la tierra
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Composición de la tierra', 'taller_i', 11, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Composición de la tierra', 'taller_i', 11, null)
    on conflict do nothing;
  -- Introducción a los nombres y capas de la tierra
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Introducción a los nombres y capas de la tierra', 'both', 12, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Introducción a los nombres y capas de la tierra', 'both', 12, null)
    on conflict do nothing;
  -- Comparación del grosor de las capas de la tierra
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Comparación del grosor de las capas de la tierra', 'both', 13, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Comparación del grosor de las capas de la tierra', 'both', 13, null)
    on conflict do nothing;
  -- Fuerza de gravedad
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Fuerza de gravedad', 'both', 14, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Fuerza de gravedad', 'both', 14, null)
    on conflict do nothing;
  -- Más detalles sobre la composición de la tierra
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Más detalles sobre la composición de la tierra', 'taller_i', 15, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Más detalles sobre la composición de la tierra', 'taller_i', 15, null)
    on conflict do nothing;
  -- Corteza terrestre, manta y núcleo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Corteza terrestre, manta y núcleo', 'both', 16, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Corteza terrestre, manta y núcleo', 'both', 16, null)
    on conflict do nothing;
  -- Detalles de la corteza terrestre
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Detalles de la corteza terrestre', 'both', 17, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Detalles de la corteza terrestre', 'both', 17, null)
    on conflict do nothing;
  -- Deposición
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Deposición', 'both', 18, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Deposición', 'both', 18, null)
    on conflict do nothing;
  -- Placas tectónicas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Placas tectónicas', 'both', 19, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Placas tectónicas', 'both', 19, null)
    on conflict do nothing;
  -- Más detalles sobre las placas tectónicas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Más detalles sobre las placas tectónicas', 'both', 20, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Más detalles sobre las placas tectónicas', 'both', 20, null)
    on conflict do nothing;
  -- Formación de las montañas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Formación de las montañas', 'both', 21, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Formación de las montañas', 'both', 21, null)
    on conflict do nothing;
  -- Montañas volcánicas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Montañas volcánicas', 'both', 22, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Montañas volcánicas', 'both', 22, null)
    on conflict do nothing;
  -- Dobleces en las montañas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Dobleces en las montañas', 'both', 23, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Dobleces en las montañas', 'both', 23, null)
    on conflict do nothing;
  -- Tipos de fallas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tipos de fallas', 'both', 24, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tipos de fallas', 'both', 24, null)
    on conflict do nothing;
  -- Montañas y valles
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Montañas y valles', 'both', 25, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Montañas y valles', 'both', 25, null)
    on conflict do nothing;
  -- Notas sobre los experimentos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Notas sobre los experimentos', 'both', 26, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Notas sobre los experimentos', 'both', 26, null)
    on conflict do nothing;
  -- Órdenes de experimentos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Órdenes de experimentos', 'both', 27, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Órdenes de experimentos', 'both', 27, null)
    on conflict do nothing;
  -- Naturaleza de la materia
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Naturaleza de la materia', 'taller_i', 28, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Naturaleza de la materia', 'taller_i', 28, null)
    on conflict do nothing;
  -- Teoría
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Teoría', 'both', 29, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Teoría', 'both', 29, null)
    on conflict do nothing;
  -- Tres estados de la materia (sólido o líquido)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tres estados de la materia (sólido o líquido)', 'both', 30, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tres estados de la materia (sólido o líquido)', 'both', 30, null)
    on conflict do nothing;
  -- Los tres estados de la materia con diferentes formas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Los tres estados de la materia con diferentes formas', 'both', 31, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Los tres estados de la materia con diferentes formas', 'both', 31, null)
    on conflict do nothing;
  -- Líquidos no tienen forma propia
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Líquidos no tienen forma propia', 'both', 32, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Líquidos no tienen forma propia', 'both', 32, null)
    on conflict do nothing;
  -- Los tres estados de la materia y fuerzas que afectan
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Los tres estados de la materia y fuerzas que afectan', 'both', 33, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Los tres estados de la materia y fuerzas que afectan', 'both', 33, null)
    on conflict do nothing;
  -- Líquidos a los lados y abajo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Líquidos a los lados y abajo', 'both', 34, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Líquidos a los lados y abajo', 'both', 34, null)
    on conflict do nothing;
  -- Gases hacia todos lados
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Gases hacia todos lados', 'both', 35, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Gases hacia todos lados', 'both', 35, null)
    on conflict do nothing;
  -- Más detalles sobre la materia
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Más detalles sobre la materia', 'both', 36, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Más detalles sobre la materia', 'both', 36, null)
    on conflict do nothing;
  -- Sólidos: rígido, plástico y elástico
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Sólidos: rígido, plástico y elástico', 'both', 37, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Sólidos: rígido, plástico y elástico', 'both', 37, null)
    on conflict do nothing;
  -- Sólidos a elásticos por su longitud
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Sólidos a elásticos por su longitud', 'both', 38, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Sólidos a elásticos por su longitud', 'both', 38, null)
    on conflict do nothing;
  -- La longitud afecta la rigidez
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'La longitud afecta la rigidez', 'both', 39, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'La longitud afecta la rigidez', 'both', 39, null)
    on conflict do nothing;
  -- Elástico dependiendo de su grosor
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Elástico dependiendo de su grosor', 'both', 40, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Elástico dependiendo de su grosor', 'both', 40, null)
    on conflict do nothing;
  -- Elástico dependiendo de la presión
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Elástico dependiendo de la presión', 'both', 41, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Elástico dependiendo de la presión', 'both', 41, null)
    on conflict do nothing;
  -- Donde se aplica presión afecta a un cuerpo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Donde se aplica presión afecta a un cuerpo', 'both', 42, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Donde se aplica presión afecta a un cuerpo', 'both', 42, null)
    on conflict do nothing;
  -- Líquidos: viscosidad y fluidez
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Líquidos: viscosidad y fluidez', 'both', 43, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Líquidos: viscosidad y fluidez', 'both', 43, null)
    on conflict do nothing;
  -- Líquidos tienen diferente fluidez
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Líquidos tienen diferente fluidez', 'both', 44, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Líquidos tienen diferente fluidez', 'both', 44, null)
    on conflict do nothing;
  -- Calor afecta a la fluidez
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Calor afecta a la fluidez', 'both', 45, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Calor afecta a la fluidez', 'both', 45, null)
    on conflict do nothing;
  -- Diferentes formas de combinar elementos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Diferentes formas de combinar elementos', 'both', 46, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Diferentes formas de combinar elementos', 'both', 46, null)
    on conflict do nothing;
  -- Teoría
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Teoría', 'both', 47, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Teoría', 'both', 47, null)
    on conflict do nothing;
  -- Soluciones (partículas que se gustan = sola)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Soluciones (partículas que se gustan = sola)', 'both', 48, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Soluciones (partículas que se gustan = sola)', 'both', 48, null)
    on conflict do nothing;
  -- Materia en suspesnsión (partículas que no se gustan)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Materia en suspesnsión (partículas que no se gustan)', 'both', 49, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Materia en suspesnsión (partículas que no se gustan)', 'both', 49, null)
    on conflict do nothing;
  -- Mezclas (partículas)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Mezclas (partículas)', 'both', 50, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Mezclas (partículas)', 'both', 50, null)
    on conflict do nothing;
  -- Reacciones químicas (se convierten en algo nuevo)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Reacciones químicas (se convierten en algo nuevo)', 'both', 51, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Reacciones químicas (se convierten en algo nuevo)', 'both', 51, null)
    on conflict do nothing;
  -- Terminología científica
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Terminología científica', 'both', 52, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Terminología científica', 'both', 52, null)
    on conflict do nothing;
  -- Separación, saturación y súper saturación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Separación, saturación y súper saturación', 'both', 53, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Separación, saturación y súper saturación', 'both', 53, null)
    on conflict do nothing;
  -- Separación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Separación', 'both', 54, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Separación', 'both', 54, null)
    on conflict do nothing;
  -- Solución saturada (parte A)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Solución saturada (parte A)', 'both', 55, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Solución saturada (parte A)', 'both', 55, null)
    on conflict do nothing;
  -- Súper saturación (parte B)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Súper saturación (parte B)', 'both', 56, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Súper saturación (parte B)', 'both', 56, null)
    on conflict do nothing;
  -- Atracción y gravedad
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Atracción y gravedad', 'both', 57, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Atracción y gravedad', 'both', 57, null)
    on conflict do nothing;
  -- Atracción
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Atracción', 'both', 58, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Atracción', 'both', 58, null)
    on conflict do nothing;
  -- Gravedad
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Gravedad', 'both', 59, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Gravedad', 'both', 59, null)
    on conflict do nothing;
  -- ¿Por qué las cosas tienen peso?
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, '¿Por qué las cosas tienen peso?', 'both', 60, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, '¿Por qué las cosas tienen peso?', 'both', 60, null)
    on conflict do nothing;
  -- Utilizando escalas para comparar el peso
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Utilizando escalas para comparar el peso', 'both', 61, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Utilizando escalas para comparar el peso', 'both', 61, null)
    on conflict do nothing;
  -- Los objetos pesados que van hacia el centro
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Los objetos pesados que van hacia el centro', 'both', 62, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Los objetos pesados que van hacia el centro', 'both', 62, null)
    on conflict do nothing;
  -- Líquidos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Líquidos', 'both', 63, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Líquidos', 'both', 63, null)
    on conflict do nothing;
  -- Sólidos (experimento 1)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Sólidos (experimento 1)', 'both', 64, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Sólidos (experimento 1)', 'both', 64, null)
    on conflict do nothing;
  -- Sólidos (experimento 2)
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Sólidos (experimento 2)', 'both', 65, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Sólidos (experimento 2)', 'both', 65, null)
    on conflict do nothing;
  -- El Sol y La Tierra
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'El Sol y La Tierra', 'taller_i', 66, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'El Sol y La Tierra', 'taller_i', 66, null)
    on conflict do nothing;
  -- La rotación de la tierra y sus consecuencias
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'La rotación de la tierra y sus consecuencias', 'taller_i', 67, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'La rotación de la tierra y sus consecuencias', 'taller_i', 67, null)
    on conflict do nothing;
  -- Dos movimientos de la tierra
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Dos movimientos de la tierra', 'both', 68, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Dos movimientos de la tierra', 'both', 68, null)
    on conflict do nothing;
  -- Día y noche
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Día y noche', 'both', 69, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Día y noche', 'both', 69, null)
    on conflict do nothing;
  -- Amanecer, mañana, medio día, atardecer y noche
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Amanecer, mañana, medio día, atardecer y noche', 'both', 70, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Amanecer, mañana, medio día, atardecer y noche', 'both', 70, null)
    on conflict do nothing;
  -- Las partes mas frías y más calientes del día
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Las partes mas frías y más calientes del día', 'both', 71, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Las partes mas frías y más calientes del día', 'both', 71, null)
    on conflict do nothing;
  -- AM y PM
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'AM y PM', 'both', 72, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'AM y PM', 'both', 72, null)
    on conflict do nothing;
  -- Meridianos y longitudes
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Meridianos y longitudes', 'taller_i', 73, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Meridianos y longitudes', 'taller_i', 73, null)
    on conflict do nothing;
  -- Latitudes
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Latitudes', 'taller_i', 74, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Latitudes', 'taller_i', 74, null)
    on conflict do nothing;
  -- Teoría
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Teoría', 'both', 75, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Teoría', 'both', 75, null)
    on conflict do nothing;
  -- Cartelón de usos horarios
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cartelón de usos horarios', 'both', 76, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cartelón de usos horarios', 'both', 76, null)
    on conflict do nothing;
  -- Notas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Notas', 'both', 77, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Notas', 'both', 77, null)
    on conflict do nothing;
  -- Notas sobre los cartelones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Notas sobre los cartelones', 'both', 78, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Notas sobre los cartelones', 'both', 78, null)
    on conflict do nothing;
  -- La Tierra es unes esfera y sus resultados
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'La Tierra es unes esfera y sus resultados', 'both', 79, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'La Tierra es unes esfera y sus resultados', 'both', 79, null)
    on conflict do nothing;
  -- Rayos perpendiculares y oblicuos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Rayos perpendiculares y oblicuos', 'both', 80, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Rayos perpendiculares y oblicuos', 'both', 80, null)
    on conflict do nothing;
  -- El mismo número de rayos cae sobre un área dif.
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'El mismo número de rayos cae sobre un área dif.', 'both', 81, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'El mismo número de rayos cae sobre un área dif.', 'both', 81, null)
    on conflict do nothing;
  -- Misma área, el doble de rayos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Misma área, el doble de rayos', 'both', 82, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Misma área, el doble de rayos', 'both', 82, null)
    on conflict do nothing;
  -- Los rayos del Sol atraviesan la atmósfera
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Los rayos del Sol atraviesan la atmósfera', 'taller_i', 83, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Los rayos del Sol atraviesan la atmósfera', 'taller_i', 83, null)
    on conflict do nothing;
  -- Notas sobre los cartelones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Notas sobre los cartelones', 'both', 84, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Notas sobre los cartelones', 'both', 84, null)
    on conflict do nothing;
  -- La tierra gira sobre su propio eje
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'La tierra gira sobre su propio eje', 'both', 85, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'La tierra gira sobre su propio eje', 'both', 85, null)
    on conflict do nothing;
  -- Solsticios
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Solsticios', 'both', 86, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Solsticios', 'both', 86, null)
    on conflict do nothing;
  -- Días cortos y largos durante el año
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Días cortos y largos durante el año', 'both', 87, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Días cortos y largos durante el año', 'both', 87, null)
    on conflict do nothing;
  -- Movimiento de traslación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Movimiento de traslación', 'taller_i', 88, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Movimiento de traslación', 'taller_i', 88, null)
    on conflict do nothing;
  -- Estaciones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Estaciones', 'both', 89, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Estaciones', 'both', 89, null)
    on conflict do nothing;
  -- Invierno, primavera, verano y otoño
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Invierno, primavera, verano y otoño', 'both', 90, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Invierno, primavera, verano y otoño', 'both', 90, null)
    on conflict do nothing;
  -- Ártico y antártico
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Ártico y antártico', 'both', 91, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Ártico y antártico', 'both', 91, null)
    on conflict do nothing;
  -- equinoccios
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'equinoccios', 'both', 92, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'equinoccios', 'both', 92, null)
    on conflict do nothing;
  -- Noción de líneas imaginarias
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Noción de líneas imaginarias', 'both', 93, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Noción de líneas imaginarias', 'both', 93, null)
    on conflict do nothing;
  -- Trópico de Cáncer y Capricornio
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Trópico de Cáncer y Capricornio', 'both', 94, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Trópico de Cáncer y Capricornio', 'both', 94, null)
    on conflict do nothing;
  -- Fechas de solsticios y equinoccios
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Fechas de solsticios y equinoccios', 'both', 95, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Fechas de solsticios y equinoccios', 'both', 95, null)
    on conflict do nothing;
  -- Relación de fechas de solsticios y equinoccios
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Relación de fechas de solsticios y equinoccios', 'both', 96, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Relación de fechas de solsticios y equinoccios', 'both', 96, null)
    on conflict do nothing;
  -- Cartelón de las zonas de la tierra y de trabajo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cartelón de las zonas de la tierra y de trabajo', 'both', 97, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cartelón de las zonas de la tierra y de trabajo', 'both', 97, null)
    on conflict do nothing;
  -- Cartelón transportador
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cartelón transportador', 'both', 98, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cartelón transportador', 'both', 98, null)
    on conflict do nothing;
  -- Cartelón de las estaciones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cartelón de las estaciones', 'both', 99, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cartelón de las estaciones', 'both', 99, null)
    on conflict do nothing;
  -- Potección de la atmósfera
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Potección de la atmósfera', 'taller_i', 100, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Potección de la atmósfera', 'taller_i', 100, null)
    on conflict do nothing;
  -- Dos tipos de calor
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Dos tipos de calor', 'both', 101, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Dos tipos de calor', 'both', 101, null)
    on conflict do nothing;
  -- Lluvias
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Lluvias', 'taller_i', 102, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Lluvias', 'taller_i', 102, null)
    on conflict do nothing;
  -- Preludios de los vientos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Preludios de los vientos', 'taller_i', 103, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Preludios de los vientos', 'taller_i', 103, null)
    on conflict do nothing;
  -- Aire que ocupa espacio
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Aire que ocupa espacio', 'both', 104, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Aire que ocupa espacio', 'both', 104, null)
    on conflict do nothing;
  -- Aire caliente que se eleva
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Aire caliente que se eleva', 'both', 105, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Aire caliente que se eleva', 'both', 105, null)
    on conflict do nothing;
  -- Nombres de los vientos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Nombres de los vientos', 'taller_i', 106, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Nombres de los vientos', 'taller_i', 106, null)
    on conflict do nothing;
  -- Vientos alisios y contralisios
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Vientos alisios y contralisios', 'taller_i', 107, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Vientos alisios y contralisios', 'taller_i', 107, null)
    on conflict do nothing;
  -- Tipos de vientos alisios
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tipos de vientos alisios', 'taller_i', 108, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tipos de vientos alisios', 'taller_i', 108, null)
    on conflict do nothing;
  -- Vientos del este y del oeste
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Vientos del este y del oeste', 'taller_i', 109, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Vientos del este y del oeste', 'taller_i', 109, null)
    on conflict do nothing;
  -- Latitudes
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Latitudes', 'taller_i', 110, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Latitudes', 'taller_i', 110, null)
    on conflict do nothing;
  -- Brisas terrestres y marinas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Brisas terrestres y marinas', 'both', 111, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Brisas terrestres y marinas', 'both', 111, null)
    on conflict do nothing;
  -- Cambios en los vientos causados por las estaciones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cambios en los vientos causados por las estaciones', 'taller_i', 112, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cambios en los vientos causados por las estaciones', 'taller_i', 112, null)
    on conflict do nothing;
  -- Las partes mas frías y mas calientes de la tierra
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Las partes mas frías y mas calientes de la tierra', 'both', 113, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Las partes mas frías y mas calientes de la tierra', 'both', 113, null)
    on conflict do nothing;
  -- Sol y lluvia
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Sol y lluvia', 'both', 114, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Sol y lluvia', 'both', 114, null)
    on conflict do nothing;
  -- Lluvias
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Lluvias', 'taller_i', 115, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Lluvias', 'taller_i', 115, null)
    on conflict do nothing;
  -- Lluvias locales y ecuatoriales
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Lluvias locales y ecuatoriales', 'taller_i', 116, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Lluvias locales y ecuatoriales', 'taller_i', 116, null)
    on conflict do nothing;
  -- Cartelón de trabajo de los vientos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Cartelón de trabajo de los vientos', 'taller_i', 117, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Cartelón de trabajo de los vientos', 'taller_i', 117, null)
    on conflict do nothing;
  -- Corrientes en el océano
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Corrientes en el océano', 'both', 118, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Corrientes en el océano', 'both', 118, null)
    on conflict do nothing;
  -- Las corrientes marinas en el mundo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Las corrientes marinas en el mundo', 'both', 119, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Las corrientes marinas en el mundo', 'both', 119, null)
    on conflict do nothing;
  -- El viento como escultor
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'El viento como escultor', 'both', 120, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'El viento como escultor', 'both', 120, null)
    on conflict do nothing;
  -- Trabajo del río
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Trabajo del río', 'taller_ii', 121, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Trabajo del río', 'taller_ii', 121, null)
    on conflict do nothing;
  -- Ríos, corrientes y depósitos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Ríos, corrientes y depósitos', 'both', 122, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Ríos, corrientes y depósitos', 'both', 122, null)
    on conflict do nothing;
  -- Tierras altas y bajas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tierras altas y bajas', 'both', 123, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tierras altas y bajas', 'both', 123, null)
    on conflict do nothing;
  -- La corriente de un río
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'La corriente de un río', 'both', 124, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'La corriente de un río', 'both', 124, null)
    on conflict do nothing;
  -- Otras fuentes para un río
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Otras fuentes para un río', 'both', 125, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Otras fuentes para un río', 'both', 125, null)
    on conflict do nothing;
  -- Los pueblos y las ciudades crecen alrededor de un río
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Los pueblos y las ciudades crecen alrededor de un río', 'both', 126, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Los pueblos y las ciudades crecen alrededor de un río', 'both', 126, null)
    on conflict do nothing;
  -- Valles y cañones con forma de "V"
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Valles y cañones con forma de "V"', 'both', 127, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Valles y cañones con forma de "V"', 'both', 127, null)
    on conflict do nothing;
  -- Lluvias y Océanos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Lluvias y Océanos', 'taller_i', 128, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Lluvias y Océanos', 'taller_i', 128, null)
    on conflict do nothing;
  -- Erosión
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Erosión', 'taller_ii', 129, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Erosión', 'taller_ii', 129, null)
    on conflict do nothing;
  -- La tierra como pilar
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'La tierra como pilar', 'both', 130, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'La tierra como pilar', 'both', 130, null)
    on conflict do nothing;
  -- Olas océanicas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Olas océanicas', 'both', 131, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Olas océanicas', 'both', 131, null)
    on conflict do nothing;
  -- Hielo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Hielo', 'both', 132, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Hielo', 'both', 132, null)
    on conflict do nothing;
  -- Glaciares
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Glaciares', 'taller_ii', 133, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Glaciares', 'taller_ii', 133, null)
    on conflict do nothing;
  -- Ciclo del agua
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Ciclo del agua', 'taller_ii', 134, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Ciclo del agua', 'taller_ii', 134, null)
    on conflict do nothing;
  -- Esparcimiento de la vegetación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Esparcimiento de la vegetación', 'taller_ii', 135, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Esparcimiento de la vegetación', 'taller_ii', 135, null)
    on conflict do nothing;
  -- Tres zonas de vegetación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Tres zonas de vegetación', 'taller_ii', 136, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Tres zonas de vegetación', 'taller_ii', 136, null)
    on conflict do nothing;
  -- ¿Qué personas viven en éstas zonas?
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, '¿Qué personas viven en éstas zonas?', 'both', 137, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, '¿Qué personas viven en éstas zonas?', 'both', 137, null)
    on conflict do nothing;
  -- Interdependencia entre los seres humanos
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Interdependencia entre los seres humanos', 'taller_ii', 138, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Interdependencia entre los seres humanos', 'taller_ii', 138, null)
    on conflict do nothing;
  -- Teoría
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Teoría', 'both', 139, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Teoría', 'both', 139, null)
    on conflict do nothing;
  -- Actividades introductorias
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Actividades introductorias', 'both', 140, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Actividades introductorias', 'both', 140, null)
    on conflict do nothing;
  -- Material en tarjetas
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Material en tarjetas', 'both', 141, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Material en tarjetas', 'both', 141, null)
    on conflict do nothing;
  -- 1ra act: ¿De dónde viene nuestra comida?
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, '1ra act: ¿De dónde viene nuestra comida?', 'both', 142, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, '1ra act: ¿De dónde viene nuestra comida?', 'both', 142, null)
    on conflict do nothing;
  -- 2da act: ¿Qué podemos obtener del granjero?
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, '2da act: ¿Qué podemos obtener del granjero?', 'both', 143, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, '2da act: ¿Qué podemos obtener del granjero?', 'both', 143, null)
    on conflict do nothing;
  -- 3ra act: De quién necesita el granjero?
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, '3ra act: De quién necesita el granjero?', 'both', 144, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, '3ra act: De quién necesita el granjero?', 'both', 144, null)
    on conflict do nothing;
  -- 4ta act: servicio e interdependencia
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, '4ta act: servicio e interdependencia', 'taller_ii', 145, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, '4ta act: servicio e interdependencia', 'taller_ii', 145, null)
    on conflict do nothing;
  -- 5ta act: introducción a los impuestos y al gobierno
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, '5ta act: introducción a los impuestos y al gobierno', 'both', 146, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, '5ta act: introducción a los impuestos y al gobierno', 'both', 146, null)
    on conflict do nothing;
  -- ¿Qué sucede con el dinero de los impuestos?
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, '¿Qué sucede con el dinero de los impuestos?', 'both', 147, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, '¿Qué sucede con el dinero de los impuestos?', 'both', 147, null)
    on conflict do nothing;
  -- Geografía económica
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Geografía económica', 'taller_ii', 148, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Geografía económica', 'taller_ii', 148, null)
    on conflict do nothing;
  -- Teoría
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Teoría', 'both', 149, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Teoría', 'both', 149, null)
    on conflict do nothing;
  -- Estudio de los recursos naturales
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Estudio de los recursos naturales', 'both', 150, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Estudio de los recursos naturales', 'both', 150, null)
    on conflict do nothing;
  -- ¿Qué se produce y dónde se produce?
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, '¿Qué se produce y dónde se produce?', 'both', 151, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, '¿Qué se produce y dónde se produce?', 'both', 151, null)
    on conflict do nothing;
  -- ¿Qué cantidad se produce de un solo producto?
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, '¿Qué cantidad se produce de un solo producto?', 'both', 152, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, '¿Qué cantidad se produce de un solo producto?', 'both', 152, null)
    on conflict do nothing;
  -- Estudio del consumo
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Estudio del consumo', 'both', 153, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Estudio del consumo', 'both', 153, null)
    on conflict do nothing;
  -- Comparación entre consumo y producción
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Comparación entre consumo y producción', 'both', 154, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Comparación entre consumo y producción', 'both', 154, null)
    on conflict do nothing;
  -- Importaciones y exportaciones
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Importaciones y exportaciones', 'both', 155, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Importaciones y exportaciones', 'both', 155, null)
    on conflict do nothing;
  -- Comercio y su volumen
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Comercio y su volumen', 'both', 156, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Comercio y su volumen', 'both', 156, null)
    on conflict do nothing;
  -- Historia de la interrelación
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Historia de la interrelación', 'both', 157, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Historia de la interrelación', 'both', 157, null)
    on conflict do nothing;
  -- Nomenclatura de geografía
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_i, 'Nomenclatura de geografía', 'both', 158, null)
    on conflict do nothing;
  insert into presentations (category_id, name, level, sort_order, school_id)
    values (v_cat_ii, 'Nomenclatura de geografía', 'both', 158, null)
    on conflict do nothing;
end $block$;
