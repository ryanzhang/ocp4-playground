
100 - ((node_memory_MemFree'+node_memory_Cached'+node_memory_Buffers')/node_memory_MemTotal) * 100

管用的:
rate(node_network_receive_bytes_total{endpoint="web",device='crc'}[1m])

rate(node_cpu_seconds_total{mode='system'}[1m])

node_filesystem_avail_bytes

rate(node_network_receive_bytes_total[1m])


count(node_uname_info{instance =~ '.*0:9100'})
