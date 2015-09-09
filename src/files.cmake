#
# This file is part of MUSIC.
# Copyright (c) 2014 Cajal Blue Brain, BBP/EPFL
#
# MUSIC is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# MUSIC is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

configure_file(music/music-config.hh.in
               ${PROJECT_BINARY_DIR}/music/music-config.hh
               @ONLY)

set(MUSIC_SOURCES
  BIFO.cc
  FIBO.cc
  application_map.cc
  array_data.cc
  clock.cc
  collector.cc
  configuration.cc
  connection.cc
  connectivity.cc
  connector.cc
  distributor.cc
  error.cc
  event_router.cc
  index_map.cc
  index_map_factory.cc
  ioutils.cc
  linear_index.cc
  parse.cc
  permutation_index.cc
  port.cc
  predict_rank.cc
  runtime.cc
  sampler.cc
  setup.cc
  spatial.cc
  subconnector.cc
  synchronizer.cc
  temporal.cc
  version.cc
  )

set(MUSIC_C_SOURCES
  music-c.cc
  music-c-c.c
  predict_rank-c.cc
  )

set(MUSIC_HEADERS
  music/BIFO.hh
  music/FIBO.hh
  music/application_map.hh
  music/array_data.hh
  music/clock.hh
  music/collector.hh
  music/communication.hh
  music/configuration.hh
  music/connection.hh
  music/connectivity.hh
  music/connector.hh
  music/data_map.hh
  music/debug.hh
  music/distributor.hh
  music/error.hh
  music/event_router.hh
  music/index_map.hh
  music/index_map_factory.hh
  music/interval.hh
  music/interval_tree.hh
  music/ioutils.hh
  music/linear_index.hh
  music/message.hh
  music/parse.hh
  music/permutation_index.hh
  music/port.hh
  music/predict_rank.hh
  music/runtime.hh
  music/sampler.hh
  music/setup.hh
  music/spatial.hh
  music/subconnector.hh
  music/synchronizer.hh
  music/temporal.hh
  music/version.hh
  )

set(MUSIC_C_PUBLIC_HEADERS
  music-c.h)

# The original autoconf scripts install also predict-rank-c.h. It has been
# excluded because it's C++ countepart is not exported, which makes it look
# like a private header.
set(MUSIC_PUBLIC_HEADERS
  music.hh
  music/BIFO.hh
  music/FIBO.hh
  music/application_map.hh
  music/array_data.hh
  music/clock.hh
  music/collector.hh
  music/communication.hh
  music/configuration.hh
  music/connectivity.hh
  music/connector.hh
  music/connection.hh
  music/cont_data.hh
  music/distributor.hh
  music/event.hh
  music/event_router.hh
  music/data_map.hh
  music/debug.hh
  music/error.hh
  music/linear_index.hh
  music/index_map.hh
  music/index_map_factory.hh
  music/interval.hh
  music/interval_tree.hh
  music/ioutils.hh
  music/message.hh
  music/port.hh
  music/permutation_index.hh
  music/runtime.hh
  music/setup.hh
  music/sampler.hh
  music/spatial.hh
  music/subconnector.hh
  music/synchronizer.hh
  music/temporal.hh
  music/version.hh
  )

