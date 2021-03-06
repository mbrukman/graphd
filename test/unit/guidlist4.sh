# Copyright 2015 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#!/bin/bash

B=`basename $0 .sh`
cd `dirname $0`
source ./rungraphd

rm -rf $D
rungraphd -d${D} -bty <<-'EOF'
	write (value="a")
	write (value="b")
	write (value="c")
	write (value=null)
	read id="guid = = b"       (result=((value))
					guid=(00000012400034568000000000000000 00000012400034568000000000000001)
					guid=(00000012400034568000000000000001 00000012400034568000000000000002))
	read id="guid = = EMPTY"   (result=((value))
					guid=(00000012400034568000000000000000 00000012400034568000000000000001)
					guid=(00000012400034568000000000000002))
	read id="guid = = SEMANTICS" (result=((value)) 
					guid=(00000012400034568000000000000000 null)
					guid=(null 00000012400034568000000000000001))
	read id="guid = = SEMANTICS"    (result=((value))
					guid=(00000012400034568000000000000000 null)
					guid=null)
	read id="guid = != b"      (result=((value))
					guid=(00000012400034568000000000000000 00000012400034568000000000000001)
					guid!=(00000012400034568000000000000000))
	read id="guid = != EMPTY"  (result=((value))
					guid=(00000012400034568000000000000000 00000012400034568000000000000001)
					guid!=(00000012400034568000000000000000 00000012400034568000000000000001))
	read id="guid = != SEMANTICS"   (result=((value)) 
					guid=(00000012400034568000000000000000 null)
					guid!=(00000012400034568000000000000000))
	read id="guid = != SEMANTICS"      (result=((value)) 
					guid=(00000012400034568000000000000000 null)
					guid!=null)
	read id="guid = ~= b"      (result=((value))
					guid=(00000012400034568000000000000000 00000012400034568000000000000001)
					guid~=(00000012400034568000000000000001))
	read id="guid = ~= EMPTY"  (result=((value))
					guid=(00000012400034568000000000000000 00000012400034568000000000000001)
					guid~=(00000012400034568000000000000002))
	read id="guid = ~= SEMANTICS"   (result=((value)) 
					guid=(00000012400034568000000000000000 null)
					guid~=())
	read id="guid = ~= SEMANTICS"   (result=((value))
					guid=(00000012400034568000000000000000 null)
					guid~=null)
	read id="guid = ~= SEMANTICS"   (result=((value))
					guid=(00000012400034568000000000000000 null)
					guid~=(null))
	read id="guid = ~= SEMANTICS"      (result=((value))
					guid=(00000012400034568000000000000000 null)
					guid~=(	00000012400034568000000000000000
						00000012400034568000000000000001
						00000012400034568000000000000002))
	read id="guid != = c"      (result=((value))
					guid!=(00000012400034568000000000000000 00000012400034568000000000000001)
					guid=(00000012400034568000000000000001 00000012400034568000000000000002))
	read id="guid != = EMPTY"  (result=((value))
					guid!=(00000012400034568000000000000000 00000012400034568000000000000001)
					guid=(00000012400034568000000000000000))
	read id="guid != = SEMANTICS"      (result=((value))
					guid!=(00000012400034568000000000000000 null)
					guid=(null 00000012400034568000000000000001))
	read id="guid != = SEMANTICS"    (result=((value)) guid!=(null)
					guid=(	00000012400034568000000000000001
						00000012400034568000000000000002
						00000012400034568000000000000000))
	read id="guid != != SEMANTICS"     (result=((value))
					guid!=(00000012400034568000000000000000 00000012400034568000000000000001)
					guid!=(00000012400034568000000000000001 null))
	read id="guid != != SEMANTICS" (result=((value)) 
					guid!=(00000012400034568000000000000000 00000012400034568000000000000001)
					guid!=(null 00000012400034568000000000000002))
	read id="guid != != b+null"     (result=((value))
					guid!=(00000012400034568000000000000000 00000012400034568000000000000002)
					guid!=(00000012400034568000000000000002))
	read id="guid != != SEMANTICS"   (result=((value)) guid!=(null)     guid!=null)
	read id="guid != ~= c"     (result=((value))
					guid!=(00000012400034568000000000000000 00000012400034568000000000000001)
					guid~=(00000012400034568000000000000002))
	read id="guid != ~= b"     (result=((value))
					guid!=(00000012400034568000000000000000 00000012400034568000000000000002)
					guid~=(00000012400034568000000000000001))
	read id="guid != ~= SEMANTICS"   (result=((value)) guid!=(null)    
					guid~=(	00000012400034568000000000000000
						00000012400034568000000000000001
						00000012400034568000000000000002))
	read id="guid ~= = b"      (result=((value))
					guid~=(00000012400034568000000000000000 00000012400034568000000000000001)
					guid=(00000012400034568000000000000001 00000012400034568000000000000002))
	read id="guid ~= = EMPTY"  (result=((value))
					guid~=(00000012400034568000000000000000 00000012400034568000000000000001)
					guid=(00000012400034568000000000000002))
	read id="guid ~= = SEMANTICS"   (result=((value)) 
					guid~=(00000012400034568000000000000000 null)
					guid=(null 00000012400034568000000000000001))
	read id="guid ~= = SEMANTICS"   (result=((value)) 
					guid~=(00000012400034568000000000000000 null)
					guid=null)
	read id="guid ~= != b"     (result=((value))
					guid~=(00000012400034568000000000000000 00000012400034568000000000000001)
					guid!=(00000012400034568000000000000000))
	read id="guid ~= != EMPTY" (result=((value)) 
					guid~=(00000012400034568000000000000000 00000012400034568000000000000001)
					guid!=(00000012400034568000000000000000 00000012400034568000000000000001))
	read id="guid ~= != SEMANTICS"  (result=((value))
					guid=(00000012400034568000000000000000 null)
					guid!=(00000012400034568000000000000000))
	read id="guid ~= != SEMANTICS"     (result=((value))
					guid=(00000012400034568000000000000000 null)
					guid!=null)
	read id="guid ~= ~= b"     (result=((value))
					guid~=(00000012400034568000000000000000 00000012400034568000000000000001)
					guid~=(00000012400034568000000000000001))
	read id="guid ~= ~= EMPTY" (result=((value)) 
					guid~=(00000012400034568000000000000000 00000012400034568000000000000001)
					guid~=(00000012400034568000000000000002))
	read id="guid ~= ~= SEMANTICS"  (result=((value))
					guid~=(00000012400034568000000000000000 null)
					guid~=())
	read id="guid ~= ~= SEMANTICS"  (result=((value))
					guid~=(00000012400034568000000000000000 null)
					guid~=null)
	read id="guid ~= ~= SEMANTICS"  (result=((value))
						guid~=(00000012400034568000000000000000 null)
						guid~=(null))
	read id="guid ~= ~= a"     (result=((value))
					guid=(00000012400034568000000000000000)
					guid~=(	00000012400034568000000000000000
						00000012400034568000000000000001
						00000012400034568000000000000002))
	restore ("5" 0 0)
	write (value="null")
	write (value="a" typeguid=00000012400034568000000000000000)
	write (value="b" typeguid=00000012400034568000000000000001)
	write (value="c" typeguid=00000012400034568000000000000002)
	read id="typeguid = = b"       (result=((value))
					typeguid=(00000012400034568000000000000000 00000012400034568000000000000001)
					typeguid=(00000012400034568000000000000001 00000012400034568000000000000002))
	read id="typeguid = = EMPTY"   (result=((value))
					typeguid=(00000012400034568000000000000000 00000012400034568000000000000001)
					typeguid=(00000012400034568000000000000002))
	read id="typeguid = = null"    (result=((value)) 
					typeguid=(00000012400034568000000000000000 null)
					typeguid=(null 00000012400034568000000000000001))
	read id="typeguid = = null"    (result=((value))
					typeguid=(00000012400034568000000000000000 null)
					typeguid=null)
	read id="typeguid = != b"      (result=((value))
					typeguid=(00000012400034568000000000000000 00000012400034568000000000000001)
					typeguid!=(00000012400034568000000000000000))
	read id="typeguid = != EMPTY"  (result=((value))
					typeguid=(00000012400034568000000000000000 00000012400034568000000000000001)
					typeguid!=(00000012400034568000000000000000 00000012400034568000000000000001))
	read id="typeguid = != null"   (result=((value)) 
					typeguid=(00000012400034568000000000000000 null)
					typeguid!=(00000012400034568000000000000000))
	read id="typeguid = != a"      (result=((value)) 
					typeguid=(00000012400034568000000000000000 null)
					typeguid!=null)
	read id="typeguid = ~= b"      (result=((value))
					typeguid=(00000012400034568000000000000000 00000012400034568000000000000001)
					typeguid~=(00000012400034568000000000000001))
	read id="typeguid = ~= EMPTY"  (result=((value))
					typeguid=(00000012400034568000000000000000 00000012400034568000000000000001)
					typeguid~=(00000012400034568000000000000002))
	read id="typeguid = ~= null"   (result=((value)) 
					typeguid=(00000012400034568000000000000000 null)
					typeguid~=())
	read id="typeguid = ~= null"   (result=((value))
					typeguid=(00000012400034568000000000000000 null)
					typeguid~=null)
	read id="typeguid = ~= null"   (result=((value))
					typeguid=(00000012400034568000000000000000 null)
					typeguid~=(null))
	read id="typeguid = ~= a"      (result=((value))
					typeguid=(00000012400034568000000000000000 null)
					typeguid~=(	00000012400034568000000000000000
						00000012400034568000000000000001
						00000012400034568000000000000002))
	read id="typeguid != = c"    (result=((value))
					typeguid!=(00000012400034568000000000000000
						  00000012400034568000000000000001)
					typeguid=(00000012400034568000000000000001
						  00000012400034568000000000000002))
	read id="typeguid != = EMPTY"  (result=((value))
					typeguid!=(00000012400034568000000000000000
						   00000012400034568000000000000001)
					typeguid=(00000012400034568000000000000000))
	read id="typeguid != = b"      (result=((value))
					typeguid!=(00000012400034568000000000000000 null)
					typeguid=(null 00000012400034568000000000000001))
	read id="typeguid != = abc"    (result=((value)) typeguid!=(null)
					typeguid=(	00000012400034568000000000000001
						00000012400034568000000000000002
						00000012400034568000000000000000))
	read id="typeguid != != c"     (result=((value))
					typeguid!=(00000012400034568000000000000000 00000012400034568000000000000001)
					typeguid!=(00000012400034568000000000000001 null))
	read id="typeguid != != EMPTY" (result=((value)) 
					typeguid!=(00000012400034568000000000000000 00000012400034568000000000000001)
					typeguid!=(null 00000012400034568000000000000002))
	read id="typeguid != != b"     (result=((value))
					typeguid!=(00000012400034568000000000000000 null)
					typeguid!=(00000012400034568000000000000002))
	read id="typeguid != != abc"   (result=((value)) typeguid!=(null)     typeguid!=null)
	read id="typeguid != ~= c"     (result=((value))
					typeguid!=(00000012400034568000000000000000
						   00000012400034568000000000000001)
					typeguid~=(00000012400034568000000000000002))
	read id="typeguid != ~= EMPTY" (result=((value))
					typeguid!=(00000012400034568000000000000000
						   00000012400034568000000000000001)
					typeguid~=(00000012400034568000000000000001))
	read id="typeguid != ~= b"     (result=((value))
					typeguid!=(00000012400034568000000000000000 null)
					typeguid~=(00000012400034568000000000000001))
	read id="typeguid != ~= abc"   (result=((value)) typeguid!=(null)    
					typeguid~=(	00000012400034568000000000000000
						00000012400034568000000000000001
						00000012400034568000000000000002))
	read id="typeguid ~= = b"      (result=((value))
					typeguid=(00000012400034568000000000000000 00000012400034568000000000000001)
					typeguid=(00000012400034568000000000000001 00000012400034568000000000000002))
	read id="typeguid ~= = EMPTY"  (result=((value))
					typeguid=(00000012400034568000000000000000 00000012400034568000000000000001)
					typeguid=(00000012400034568000000000000002))
	read id="typeguid ~= = null"   (result=((value)) 
					typeguid=(00000012400034568000000000000000 null)
					typeguid=(null 00000012400034568000000000000001))
	read id="typeguid ~= = null"   (result=((value)) 
					typeguid=(00000012400034568000000000000000 null)
					typeguid=null)
	read id="typeguid ~= != b"     (result=((value))
					typeguid=(00000012400034568000000000000000 00000012400034568000000000000001)
					typeguid!=(00000012400034568000000000000000))
	read id="typeguid ~= != EMPTY" (result=((value)) 
					typeguid=(00000012400034568000000000000000 00000012400034568000000000000001)
					typeguid!=(00000012400034568000000000000000 00000012400034568000000000000001))
	read id="typeguid ~= != null"  (result=((value))
					typeguid=(00000012400034568000000000000000 null)
					typeguid!=(00000012400034568000000000000000))
	read id="typeguid ~= != a"     (result=((value))
					typeguid=(00000012400034568000000000000000 null)
					typeguid!=null)
	read id="typeguid ~= ~= b"     (result=((value))
					typeguid=(00000012400034568000000000000000 00000012400034568000000000000001)
					typeguid~=(00000012400034568000000000000001))
	read id="typeguid ~= ~= EMPTY" (result=((value)) 
					typeguid=(00000012400034568000000000000000 00000012400034568000000000000001)
					typeguid~=(00000012400034568000000000000002))
	read id="typeguid ~= ~= null"  (result=((value))
					typeguid=(00000012400034568000000000000000 null)
					typeguid~=())
	read id="typeguid ~= ~= null"  (result=((value))
					typeguid=(00000012400034568000000000000000 null)
					typeguid~=null)
	read id="typeguid ~= ~= null"  (result=((value)) typeguid=(00000012400034568000000000000000 null)  typeguid~=(null))
	read id="typeguid ~= ~= a"     (result=((value))
					typeguid=(00000012400034568000000000000000 null)
					typeguid~=(	00000012400034568000000000000000
						00000012400034568000000000000001
						00000012400034568000000000000002))
	EOF
rm -rf $D
