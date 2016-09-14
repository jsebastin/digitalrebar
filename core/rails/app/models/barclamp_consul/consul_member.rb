# Copyright 2014, Victor Lowther
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'resolv'

class BarclampConsul::ConsulMember < Role

  def sync_on_todo(nr)
    Attrib.transaction do
      if Attrib.get("consul-address",nr).nil?
        Attrib.set_without_save("consul-address",nr,nr.node.addresses.first.addr)
      end
    end
    true
  end
end