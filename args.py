"""
convert string args to list of str, as required by vs code debugger
Usage: args.py --model /model_retriever/retriever.pt  --data_dir /retriever_input/   --kb_dir /kb/ \
--k 100 --num_cands 64  --pretrained_path /blink/BLINK/models/ --gpus 0,1,2,3  --max_len 42   \
--mention_bsz 4096 --entity_bsz 2048  --epochs 4  --B 4  --lr 2e-6  --rands_ratio 0.9   \
--logging_step 100 --warmup_proportion 0.2  --out_dir /reader_input/   \
--gradient_accumulation_steps 2  --type_loss sum_log_nce   \
--cands_embeds_path /candidates_embeds/candidate_embeds.npy \
--blink  --add_topic
"""
import sys, json
args = sys.argv[1:]
args = filter(lambda s: s not in ["'", '"'], args)
args = list(args)
if len(args) == 1:
    args = args[0].split()
print(json.dumps(args))
# OR, print one by one
curline = []
for arg in args:
    if arg.startswith("-"):
        if curline:
            print(", ".join(map(lambda s: f'"{s}"', curline)) + ",")
        curline = [arg]
    else:
        curline.append(arg)
if curline:
    print(", ".join(map(lambda s: f'"{s}"', curline)) + ",")
