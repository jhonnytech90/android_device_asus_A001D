/*
 * Copyright (C) 2020 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * libshims_camera — ASUS A001D (ZB634KL) MSM8953
 *
 * FASE 2: Este arquivo será preenchido após análise dos blobs
 * extraídos da ROM Oreo com readelf.
 *
 * Símbolos típicos que precisam de shim em blobs MSM8953 Oreo:
 *   - _ZN7android17GraphicBufferMapper17importBufferLocked (GraphicBuffer API)
 *   - gui_GraphicBuffer símbolos removidos no Android 10
 *
 * Exemplo de shim típico:
 *
 * extern "C" {
 *
 * // Símbolo removido no Android 10 que o blob ainda chama
 * void* _ZN7android6Parcel15readNativeHandleEv() {
 *     return nullptr;
 * }
 *
 * } // extern "C"
 */

// Placeholder — preenchido na Fase 2
