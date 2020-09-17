/****************************************************************************
 * Copyright 2020, Optimizely, Inc. and contributors                        *
 *                                                                          *
 * Licensed under the Apache License, Version 2.0 (the "License");          *
 * you may not use this file except in compliance with the License.         *
 * You may obtain a copy of the License at                                  *
 *                                                                          *
 *    http://www.apache.org/licenses/LICENSE-2.0                            *
 *                                                                          *
 * Unless required by applicable law or agreed to in writing, software      *
 * distributed under the License is distributed on an "AS IS" BASIS,        *
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. *
 * See the License for the specific language governing permissions and      *
 * limitations under the License.                                           *
 ***************************************************************************/

import './optimizely_experiment.dart';
import './optimizely_feature.dart';

class OptimizelyConfig {
  String revision;
  Map<String, OptimizelyExperiment> experimentsMap;
  Map<String, OptimizelyFeature> featuresMap;

  OptimizelyConfig(this.revision, this.experimentsMap, this.featuresMap);

  factory OptimizelyConfig.fromJson(Map<String, dynamic> json) =>
      _$OptimizelyConfigFromJson(json);

  Map<String, dynamic> toJson() => _$OptimizelyConfigToJson(this);
}

OptimizelyConfig _$OptimizelyConfigFromJson(Map<String, dynamic> json) {
  return OptimizelyConfig(
    json['revision'] as String,
    (json['experimentsMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : OptimizelyExperiment.fromJson(e as Map<String, dynamic>)),
    ),
    (json['featuresMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : OptimizelyFeature.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$OptimizelyConfigToJson(OptimizelyConfig instance) =>
    <String, dynamic>{
      'revision': instance.revision,
      'experimentsMap': instance.experimentsMap,
      'featuresMap': instance.featuresMap,
    };
